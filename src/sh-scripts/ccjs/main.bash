#! /usr/bin/env bash
# ============================================================================ #
#
# Operate on `compile_commands.json' files.
#
#
# ---------------------------------------------------------------------------- #

set -eu;
set -o pipefail;


# ---------------------------------------------------------------------------- #

_as_me="ccjs";

_version="0.1.0";

_usage_msg="USAGE: $_as_me [OPTIONS...] COMMAND [CMD-OPTIONS...] [ARGS...]

Operate on \`compile_commands.json' files.
";

#shellcheck disable=SC2140
_help_msg="$_usage_msg
COMMANDS
  add FILE FLAGS      Add entry to \`compile_commands.json'.
  remove FILE         Remove entries from \`compile_commands.json'.
  list                List all entries in \`compile_commands.json'.
  show FILE           Show entry from \`compile_commands.json'.

OPTIONS
  -h,--help           Print help message to STDOUT.
  -u,--usage          Print usage message to STDOUT.
  -v,--version        Print version information to STDOUT.

ENVIRONMENT
  CCJS_OUT            Output file. Default: \`./compile_commands.json'.
  JQ                  Command used as \`jq' executable.
  REALPATH            Command used as \`realpath' executable.
  MKTEMP              Command used as \`mktemp' executable.
";


# ---------------------------------------------------------------------------- #

usage() {
  if [[ "${1:-}" = "-f" ]]; then
    echo "$_help_msg";
  else
    echo "$_usage_msg";
  fi
}


# ---------------------------------------------------------------------------- #

# @BEGIN_INJECT_UTILS@
# TOOD: search "up" to project root to find `compile_commands.json' file.
: "${CCJS_OUT:=$PWD/compile_commands.json}";
: "${JQ:=jq}";
: "${REALPATH:=realpath}";
: "${MKTEMP:=mktemp}";


# ---------------------------------------------------------------------------- #

declare -a tmp_files tmp_dirs;
tmp_files=();
tmp_dirs=();

mktmp_auto() {
  local _f;
  _f="$( $MKTEMP "$@"; )";
  case " $* " in
    *\ -d\ *|*\ --directory\ *) tmp_dirs+=( "$_f" ); ;;
    *)                          tmp_files+=( "$_f" ); ;;
  esac
  echo "$_f";
}


# ---------------------------------------------------------------------------- #

cleanup() {
  rm -f "${tmp_files[@]}";
  rm -rf "${tmp_dirs[@]}";
}

_es=0;
trap '_es="$?"; cleanup; exit "$_es";' HUP TERM INT QUIT EXIT;


# ---------------------------------------------------------------------------- #



# ---------------------------------------------------------------------------- #

# Add sub-command

add() {
  local _file;
  _file="$1";
  shift;
  declare -a _flags;
  _flags=( "$@" );
}


# ---------------------------------------------------------------------------- #

# Parse "global" options up until the first sub-command name.

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    # Split short options such as `-abc' -> `-a -b -c'
    -[^-]?*)
      _arg="$1";
      declare -a _args;
      _args=();
      shift;
      _i=1;
      while [[ "$_i" -lt "${#_arg}" ]]; do
        _args+=( "-${_arg:$_i:1}" );
        _i="$(( _i + 1 ))";
      done
      set -- "${_args[@]}" "$@";
      unset _arg _args _i;
      continue;
    ;;
    --*=*)
      _arg="$1";
      shift;
      set -- "${_arg%%=*}" "${_arg#*=}" "$@";
      unset _arg;
      continue;
    ;;
    -u|--usage)    usage;    exit 0; ;;
    -h|--help)     usage -f; exit 0; ;;
    -v|--version)  echo "$_version"; exit 0; ;;
    --) shift; break; ;;
    -?|--*)
      {
        printf "%s: Unrecognized option: '%s'. " "$_as_me" "$1";
        echo 'Did you forget to name a sub-command?';
      } >&2;
      usage -f >&2;
      exit 1;
    ;;
    add|remove|list|show) break; ;;
    *)
      echo "$_as_me: Unexpected argument(s) '$*'" >&2;
      usage -f >&2;
      exit 1;
      ;;
  esac
  shift;
done


# ---------------------------------------------------------------------------- #

if [[ -n "${_TARGET_FILE}" ]]; then
  _TARGET_FILE="$("$REALPATH" "$_TARGET_FILE"; )";
elif [[ -z "${CCJS_SILENT:-}" ]]; then
  {
    echo "$_as_me: Could not determine the target file.";
    printf '      You must use a source file with one of the ';
    echo "following extensions:";
    echo "      .c .h .cc .cpp .hpp .cxx .hxx .c++ .h++ .ipp";
    echo "Falling back to normal \`$CCJS_COMPILER' invocation."
  } >&2;
    exec "$CCJS_COMPILER" "${_cc_args[@]}";
fi

# Users can omit `-o' if they're using `-c'.
if [[ -n "${_OUTPUT_FILE:-}" ]]; then
  _OUTPUT_FILE="$("$REALPATH" "$_OUTPUT_FILE"; )";
else
  _OUTPUT_FILE="${_TARGET_FILE#.*}.o";
fi


# ---------------------------------------------------------------------------- #

_ARGS='';
for _arg in "${_cc_args[@]}"; do
  if [[ -n "$_ARGS" ]]; then
    _ARGS="$_ARGS,";
  fi
  # Escape double quotes.
  _ARGS="$_ARGS\"${_arg//\"/\\\"}\"";
done

_ENTRY="{
  \"directory\": \"$PWD\",
  \"file\": \"$_TARGET_FILE\",
  \"output\": \"$_OUTPUT_FILE\",
  \"arguments\": [$_ARGS]
}";


# ---------------------------------------------------------------------------- #

# If the file doesn't exist create it.
if ! [[ -f "$CCJS_OUT" ]]; then
  echo "[$_ENTRY]" > "$CCJS_OUT";
else
  #shellcheck disable=SC2119
  TMPFILE="$( mktmp_auto; )";

  # Add the entry to the file, and remove old entry ( if present ).
  $JQ --argjson _ENTRY "$_ENTRY" "[\$_ENTRY] + .|unique_by( .output )"  \
        "$CCJS_OUT" > "$TMPFILE";

  # Backup the original file.
  mv "$CCJS_OUT" "$CCJS_OUT~";

  # Overwrite the original file.
  mv "$TMPFILE" "$CCJS_OUT";
fi


# ---------------------------------------------------------------------------- #

if [[ -z "${CCJS_DONT_COMPILE:-}" ]]; then
  exec "$CCJS_COMPILER" "${_cc_args[@]}";
fi


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
