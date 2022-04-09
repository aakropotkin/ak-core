#! /usr/bin/env sh
source ./getopts_long.sh;
opt_b=;
opt_bar=;
opt_f=;
opt_foo=;
opt_h=;
opt_help=;
opt_long=;
opt_s=;
opt_v=;
opt_verbose=;

bar=default_bar;
foo=default_foo;
verbose=;

OPTLIND=1;

usage() {
  echo "$( basename $0; ) [-s|--long|[-v|--verbose]|[-f|--foo][=][ARG]|[-b|--bar][=][ARG]]";
}

while getopts_long :sf:b::vh opt \
  long 0 \
  foo required_argument \
  bar 2 \
  verbose no_argument \
  help 0 "" "$@";
do
  case "$opt" in
    v|verbose) verbose=:; ;;
    h|help)    usage; exit 0; ;;
    f|foo)     foo=$OPTLARG; ;;
    b|bar)     bar=${OPTLARG-$bar}; ;;
    :) printf >&2 '%s: %s\n' "${0##*/}" "$OPTLERR";
       usage;
       exit 1;
    ;;
  esac
  eval opt_$opt=:;
done
shift "$(($OPTLIND - 1))";
echo "\$@: $@";
echo "opt_b = $opt_b";
echo "opt_bar = $opt_bar";
echo "opt_f = $opt_f";
echo "opt_foo = $opt_foo";
echo "opt_h = $opt_h";
echo "opt_help = $opt_help";
echo "opt_long = $opt_long";
echo "opt_s = $opt_s";
echo "opt_v = $opt_v";
echo "opt_verbose = $opt_verbose";

echo "bar = $bar";
echo "foo = $foo";
echo "verbose = $verbose";
