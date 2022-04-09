#! /usr/bin/env sh
delim=' ';
silent=;
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
        delim)
          opt="$OPTARG";
          OPTARG="${!OPTIND}";
          OPTIND=$(( OPTIND + 1 ));
        ;;
        *)
          opt="$OPTARG";
          OPTARG=;
        ;;
      esac
    ;;
  esac
  case "$opt" in
    d|delim)
      delim="$OPTARG";
    ;;
    s|silent)
      silent=:;
    ;;
  esac
done
shift $(( OPTIND - 1 ));
echo "\$@: $@";
echo "silent = $silent";
echo "delim = '$delim'";
