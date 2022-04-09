#! /usr/bin/env sh
# ============================================================================ #
#
# Shows an example of complex getopts usage.
# This shows how long options may be supported.
# Additionally "mandatory" or "optional" argument parsing for long options
# may be indicated using 'LOPTSPEC'
#
# Ex:
#   $ getopts-example1.sh --delim ' x' --silent foo
#   $@: foo
#   silent = :
#   delim = ' x'
#
# Take note that in the example above, a naive parser might misattribute
# "foo" as an argument of --silent.
# This is avoided here by using LOPTSPEC.
# However, if you were to write a parser for a specific utility, a general
# purpose handling for long options would most likely not require an
# LOPTSPEC, since you may instead handle options explicitly.
#
# TODO:
#  - Handling of missing mandatory arguments remaind incomplete.
#  - Mimicking Zsh/Bash handling of leading ':' in OPTSPEC, such that
#    opt=? when an option is unrecognized, and opt=: when a mandatory argument
#    is missing instead of printing an error message.
#
#
# ---------------------------------------------------------------------------- #

# (-d|--delim)[=]ARG
# Argument is mandatory
delim=' ';
# (-s|--silent)
# No argument
silent=;

# The use of -: here is what allows parsing long options, by interpreting
# them as an argument to the option '-'. Think "OPT:ARG" = "-:-LONG[[=][LARG]]"
OPTSPEC='d:s-:'
# Commas separate long arguments.
LOPTSPEC='delim:,silent';

# ---------------------------------------------------------------------------- #

while getopts d:s-: opt; do
  case "$opt" in
    -*)
      case "$OPTARG" in
        *=*)
          _arg="${OPTARG#*=}";
          opt="${OPTARG%*=$_arg}";
          OPTARG="$_arg";
          unset _arg;
        ;;
        *)
          opt="$OPTARG";
          _ORIG_OPTIND="$OPTIND";
          case "${!OPTIND:-}" in
            -*)  # Next index is a flag/option, so don't consume it.
              opt="$OPTARG";
              OPTARG=;
              case "$LOPTSPEC" in
                # Mandatory argument is missing.
                *,${opt}:,*|*,${opt}:|${opt}:,*|${opt}:)
                  case "$OPTSPEC" in
                    :|:*)
                      OPTARG="$opt";
                      opt=':';
                    ;;
                    *)
                      echo "Missing argument for --$opt" > /dev/stderr;
                    ;;
                  esac  # Missing arg
                ;;
              esac
            ;;
            *)   # Next index is not a flag/option, consume as argument.
              case "$LOPTSPEC" in
                *,${opt}:,*|*,${opt}:|${opt}:,*|${opt}:)
                  OPTARG="${!OPTIND}";
                  OPTIND=$(( OPTIND + 1 ));
                ;;
                *,${opt}::,*|*,${opt}::|${opt}::,*|${opt}::)
                  OPTARG="${!OPTIND:-}";
                  OPTIND=$(( OPTIND + 1 ));
                ;;
                *)
                  OPTARG=;
                ;;
              esac  # $LOPTSPEC
            ;;
          esac  # ${!OPTIND}
          case "$LOPTSPEC" in
            *,${opt},*|*,${opt}:,*${opt}::,*|\
            ${opt},*|${opt}:,*|${opt}::,*|\
            *,${opt}|*,${opt}:|*,${opt}::|\
            ${opt}|${opt}:|${opt}::)  # Option appears in LOPTSPEC
              :;
            ;;
            *)  # Option is not listed in LOPTSPEC
              OPTARG="$opt";
              opt="?";
              OPTIND="$_ORIG_OPTIND";
            ;;
          esac
          unset _ORIG_OPTIND;
        ;;
      esac  # $opt
    ;;
  esac
  case "$opt" in
    d|delim)
      delim="$OPTARG";
    ;;
    s|silent)
      silent=:;
    ;;
    \?)
      echo "Unrecognized argument: ${!OPTIND}" > /dev/stderr;
      exit 1;
    ;;
    \:)
      echo "Missing argument for: $opt" > /dev/stderr;
      exit 1;
    ;;
  esac
done
shift $(( OPTIND - 1 ));
unset LOPTSPEC;


# ---------------------------------------------------------------------------- #

echo "\$@: $@";
echo "silent = $silent";
echo "delim = '$delim'";


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
# vim: set filetype=sh :
