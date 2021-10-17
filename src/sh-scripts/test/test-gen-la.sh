#! /usr/bin/env sh

export PATH=$( realpath -s $srcdir/..; ):$PATH;
SCRIPT=gen-la;

have_deps=yes;
test -d ./.libs || have_deps=no;
test -f ./libgreet.la || have_deps=no;
test -f ./.libs/libgreet.la || have_deps=no;
test -f ./.libs/libgreet.so || have_deps=no;
test -f ./.libs/libgreet.so.0 || have_deps=no;
test -f ./.libs/libgreet.so.0.0.0 || have_deps=no;
test -f ./.libs/libgreet.a || have_deps=no;

if test "x${have_deps}" != "xyes"; then
  echo "${SCRIPT}: depends on ${PWD}/libgreet.la and ${PWD}/test/.libs/" >&2;
  exit 1;
fi


TMP="$( mktemp; )";
trap 'rm -f ${TMP}; exit 1;' HUP INT QUIT PIPE TERM;

function try_recreate() {
  gen-la ${1} > ${TMP};
  rsl="${?}";

  if test "x${rsl}" != "x0"; then
    echo "${SCRIPT}: encountered a runtime error" >&2;
    exit ${rsl};
  fi

  if diff -s -I '^#' ${TMP} ./${2}|grep -q differ; then
    echo "${SCRIPT}: failed to reproduce ${PWD}/${2}" >&2;
    exit 1;
  fi
}

try_recreate ./.libs/libgreet.so       ./.libs/libgreet.la;
try_recreate ./.libs/libgreet.so.0     ./.libs/libgreet.la;
try_recreate ./.libs/libgreet.so.0.0.0 ./.libs/libgreet.la;
try_recreate ./.libs/libgreet.a        ./.libs/libgreet.la;

try_recreate ./.libs/libgreet.so       ./libgreet.la;
try_recreate ./.libs/libgreet.so.0     ./libgreet.la;
try_recreate ./.libs/libgreet.so.0.0.0 ./libgreet.la;
try_recreate ./.libs/libgreet.a        ./libgreet.la;


rm -f ${TMP};