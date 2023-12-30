#! /usr/bin/env bash
# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

set -eu;
set -o pipefail;


# ---------------------------------------------------------------------------- #

_as_me="${_as_me:-ccjs} add";

_usage_msg="USAGE: $_as_me [OPTIONS...] $_as_sub FILE OUTPUT DIRECTORY ARGS...

Add entry to \`compile_commands.json'.
";

_help_msg="$_usage_msg
Replaces existing entry if it exists.

Existing output file will be backed up by adding a \`~' suffix to its name.

ARGUMENTS
  FILE              The source file to compile ( e.g. \`foo.c' ).
  OUTPUT            The output file ( e.g. \`foo.o' ).
  DIRECTORY         The directory in which to run the compiler.

OPTIONS
  -h,--help         Print help message to STDOUT.
  -u,--usage        Print usage message to STDOUT.

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
: "${GREP:=grep}";
: "${REALPATH:=realpath}";
: "${MKTEMP:=mktemp}";


# ---------------------------------------------------------------------------- #

_FILE='';
_OUTPUT='';
_DIRECTORY='';

declare -a _cc_args;
_cc_args=();

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    -u|--usage)    usage;    exit 0; ;;
    -h|--help)     usage -f; exit 0; ;;
    *)
      if [[ -z "$_FILE" ]]; then
        _FILE="$1";
      elif [[ -z "$_OUTPUT" ]]; then
        _OUTPUT="$1";
      elif [[ -z "$_DIRECTORY" ]]; then
        _DIRECTORY="$1";
      else
        _cc_args+=( "$1" );
      fi
    ;;
  esac
  shift;
done


# ---------------------------------------------------------------------------- #

# Get absolute paths.

case "$CCJS_OUT" in
  /*) :; ;;
  *) CCJS_OUT="$( "$REALPATH" "$CCJS_OUT"; )"; ;;
esac

case "$_FILE" in
  /*) :; ;;
  *) _FILE="$( "$REALPATH" "$_FILE"; )"; ;;
esac

case "$_OUTPUT" in
  /*) :; ;;
  *) _OUTPUT="$( "$REALPATH" "$_OUTPUT"; )"; ;;
esac

case "$_DIRECTORY" in
  /*) :; ;;
  *) _DIRECTORY="$( "$REALPATH" "$_DIRECTORY"; )"; ;;
esac


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
  \"directory\": \"$_DIRECTORY\",
  \"file\": \"$_FILE\",
  \"output\": \"$_OUTPUT\",
  \"arguments\": [$_ARGS]
}";


# ---------------------------------------------------------------------------- #

# If the file doesn't exist create it.
if ! [[ -f "$CCJS_OUT" ]]; then
  echo "[$_ENTRY]" > "$CCJS_OUT";
else
  #shellcheck disable=SC2119
  TMPFILE="$( $MKTEMP; )";

  _es=0;
  trap '_es="$?"; rm -f "$TMPFILE"; exit "$_es";' HUP TERM INT QUIT EXIT;

  # Add the entry to the file, and remove old entry ( if present ).
  $JQ --argjson _ENTRY "$_ENTRY" "[\$_ENTRY] + .|unique_by( .output )"  \
        "$CCJS_OUT" > "$TMPFILE";

  # Backup the original file.
  mv "$CCJS_OUT" "$CCJS_OUT~";

  # Overwrite the original file.
  mv "$TMPFILE" "$CCJS_OUT";
fi


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
