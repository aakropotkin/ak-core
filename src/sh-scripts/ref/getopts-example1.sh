#! /usr/bin/env sh
# ============================================================================ #
#
# Shows an example of complex getopts usage.
# This shows how long options may be supported.
# Additionally "mandatory" or "optional" argument parsing for long options
# may be indicated using 'LOPTSPEC'
#
# Ex:
#   sh> getopts-example1.sh --delim ' x' --silent foo
#   $@: foo
#   silent = :
#   delim = ' x'
#   -s -d ' x' -- foo
#
# Take note that in the example above, a naive parser might misattribute
# "foo" as an argument of --silent.
# This is avoided here by using LOPTSPEC.
# However, if you were to write a parser for a specific utility, a general
# purpose handling for long options would most likely not require an
# LOPTSPEC, since you may instead handle options explicitly.
#
# Ex:
#   sh> ./getopts-example1.sh --delim ' x' f --silent
#   $@: f
#   silent = :
#   delim = ' x'
#   -s -d ' x' -- f
#
# Take note that in the example above, enountering the non-option "f", does not
# prevent --silent from being parsed.
# Rather "f" is skipped ( really it is added to a pile of unrecognized args )
# and parsing continues.
# This may or may not be a useful behavior depending on the utility you're
# writing.
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
OPTSPEC=':d:s-:'
# Commas separate long arguments.
LOPTSPEC=':delim:,silent';

# ---------------------------------------------------------------------------- #

_EXTRA_ARGS=();
while test "$#" -gt 0; do
  while getopts "$OPTSPEC": opt; do
    case "$opt" in
      -*)
        _ORIG_OPTIND="$OPTIND";
        case "$OPTARG" in
          *=*)
            _arg="${OPTARG#*=}";
            opt="${OPTARG%*=$_arg}";
            case "$LOPTSPEC" in
              # Unexpected argument
              *,${opt},*|*,${opt}|${opt},*|:${opt},*|:${opt}|${opt})
                case "$OPTSPEC $LOPTSPEC" in
                  :\ |:*|*\ :|*\ :*) :; OPTARG="-$opt=$_arg"; ;;
                  *) echo "illegal option -- -$OPTARG" > /dev/stderr; ;;
                esac  # Unexpected arg
                opt='?';
              ;;
              *) OPTARG="$_arg"; ;;
            esac
            unset _arg;
          ;; # Was '--option=value' style
          *) # Is '--option value' style
            opt="$OPTARG";
            case "${!OPTIND:-}" in
              -*)  # Next index is a flag/option, so don't consume it.
                opt="$OPTARG";
                OPTARG=;
                case "$LOPTSPEC" in
                  # Mandatory argument is missing.
                  *,${opt}:,*|*,${opt}:|${opt}:,*|:${opt}:,*|:${opt}:|${opt}:)
                    case "$OPTSPEC $LOPTSPEC" in
                      :\ |:*|*\ :|*\ :*) OPTARG="-$opt"; opt=':'; ;;
                      *) opt='?'; ;;
                    esac  # Missing arg
                  ;;
                esac
              ;;
              *)   # Next index is not a flag/option, consume as argument.
                case "$LOPTSPEC" in
                  *,${opt}:,*|*,${opt}:|${opt}:,*|${opt}:|:${opt}:,*|:${opt}:)
                    if test "$OPTIND" -gt "$#"; then
                      case "$LOPTSPEC" in
                        # Mandatory argument is missing.
                        *,${opt}:,*|*,${opt}:|${opt}:,*|${opt}:|\
                        :${opt}:,*|:${opt}:)
                          case "$OPTSPEC $LOPTSPEC" in
                            :\ |:*|*\ :|*\ :*) OPTARG="-$opt"; opt=':'; ;;
                            *) opt='?'; ;;
                          esac  # Extended OPTSPEC
                        ;;
                      esac
                    else
                      OPTARG="${!OPTIND}";
                      OPTIND=$(( OPTIND + 1 ));
                    fi
                  ;;
                  *,${opt}::,*|*,${opt}::|${opt}::,*|${opt}::|\
                  :${opt}::,*|:${opt}::)
                    OPTARG="${!OPTIND:-}";
                    OPTIND=$(( OPTIND + 1 ));
                  ;;
                  *)
                    OPTARG=;
                  ;;
                esac  # $LOPTSPEC
              ;;
            esac  # ${!OPTIND}
          ;;
        esac  # $OPTARG ( check '*=*' )
        # Detect unknown option
        case "$LOPTSPEC" in
          *,${opt},*|*,${opt}:,*${opt}::,*|\
          ${opt},*|${opt}:,*|${opt}::,*|\
          :${opt},*|:${opt}:,*|:${opt}::,*|\
          *,${opt}|*,${opt}:|*,${opt}::|\
          :${opt}|:${opt}:|:${opt}::|\
          ${opt}|${opt}:|${opt}::)  # Option appears in LOPTSPEC
            :;
          ;;
          *)  # Option is not listed in LOPTSPEC
            case "$OPTSPEC $LOPTSPEC" in
              *\ :|*\ :*) :; ;;  # It was already set above.
              :\ |:*|*\ :|*\ :*) OPTARG="-$opt"; ;;
            esac  # Extended OPTSPEC
            opt='?';
            OPTIND="$_ORIG_OPTIND";
          ;;
        esac
        unset _ORIG_OPTIND;
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
        case "$OPTSPEC $LOPTSPEC" in
          :*\ :|:*\ :*) echo "Unexpected argument: -$OPTARG" > /dev/stderr; ;;
          :|:*) echo "Unrecognized option: -$OPTARG"         > /dev/stderr; ;;
          *)    echo "Unrecognized option at index $OPTIND"  > /dev/stderr; ;;
        esac
        exit 1;
      ;;
      \:)
        case "$OPTSPEC" in
          :|:*) echo "Missing argument for: -$OPTARG"    > /dev/stderr; ;;
          *)    echo "Missing argument at index $OPTIND" > /dev/stderr; ;;
        esac
        exit 1;
      ;;
    esac
  done  # Encountered non-option argument, or out of args
  shift $(( OPTIND - 1 ));
  unset OPTIND OPTARG;
  if test "$#" -gt 0; then
    _EXTRA_ARGS+=( "$1" );
    shift;
  fi
done
unset LOPTSPEC;
set -- "${_EXTRA_ARGS[@]}";
unset _EXTRA_ARGS;


# ---------------------------------------------------------------------------- #

echo "\$@: $@";
echo "silent = $silent";
echo "delim = '$delim'";


# ---------------------------------------------------------------------------- #

FINAL_ARGS=;
test $silent && FINAL_ARGS="-s";
test "$delim" != ' ' && FINAL_ARGS="${FINAL_ARGS+$FINAL_ARGS }-d '$delim'";
FINAL_ARGS="${FINAL_ARGS+$FINAL_ARGS }--";
test "$#" -gt 0 && FINAL_ARGS="$FINAL_ARGS $*";

echo "$FINAL_ARGS";


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
# vim: set filetype=sh :
