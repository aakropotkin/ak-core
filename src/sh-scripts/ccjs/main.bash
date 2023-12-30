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

OPTIONS
  -h,--help           Print help message to STDOUT.
  -u,--usage          Print usage message to STDOUT.
  -v,--version        Print version information to STDOUT.

COMMANDS
  add FILE FLAGS      Add entry to \`compile_commands.json'.
  remove FILE         Remove entries from \`compile_commands.json'.
  list                List all entries in \`compile_commands.json'.
  show FILE           Show entry from \`compile_commands.json'.

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
: "${JQ:=jq}";
: "${REALPATH:=realpath}";
: "${MKTEMP:=mktemp}";


# ---------------------------------------------------------------------------- #

_TMP_FILES='';
_TMP_DIRS='';
export _TMP_FILES _TMP_DIRS;

#shellcheck disable=SC2120
mktmp_auto() {
  local _tmp;
  _tmp="$( $MKTEMP "$@"; )";
  case " $* " in
    *\ -d\ *|*\ --directory\ *) export _TMP_DIRS="$_TMP_DIRS:$_tmp"; ;;
    *)                          export _TMP_FILES="$_TMP_FILES:$_tmp"; ;;
  esac
  echo "$_tmp";
}


# ---------------------------------------------------------------------------- #

cleanup() {
  local _tmp_files _tmp_dirs;
  if [[ -n "$_TMP_FILES" ]]; then
    IFS=':' read -ra _tmp_files <<< "$_TMP_FILES";
    rm -f "${_tmp_files[@]}";
  fi
  if [[ -n "$_TMP_DIRS" ]]; then
    IFS=':' read -ra _tmp_dirs <<< "$_TMP_DIRS";
    rm -rf "${_tmp_dirs[@]}";
  fi
}

_es=0;
trap '_es="$?"; cleanup; exit "$_es";' HUP TERM INT QUIT EXIT;


# ---------------------------------------------------------------------------- #

# Set the output file.

if [[ -n "${CCJS_OUT:-}" ]]; then
  CCJS_OUT="$( "$REALPATH" "$CCJS_OUT"; )";
else
  # Find nearest project root or `compile_commands.json' by searching "up".
  _dir="$PWD";
  while [[ "$_dir" != "/" ]]; do
    if [[ -f "$_dir/compile_commands.json" ]]; then
      CCJS_OUT="$_dir/compile_commands.json";
      break;
    elif [[ -d "$_dir/.git" ]]; then
      CCJS_OUT="$_dir/compile_commands.json";
      break;
    elif [[ -d "$_dir/.root" ]]; then
      CCJS_OUT="$_dir/compile_commands.json";
      break;
    fi
  done
  : "${CCJS_OUT:=$PWD/compile_commands.json}";
  unset _dir;
fi


# ---------------------------------------------------------------------------- #

# Add sub-commands

. "${BASH_SOURCE[0]%/*}/ccjs_add";


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
    add)
      shift;
      ccjs_add "$@";
      exit "$?";
    ;;
    *)
      echo "$_as_me: Unexpected argument(s) '$*'" >&2;
      usage -f >&2;
      exit 1;
      ;;
  esac
  shift;
done


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
