#! /usr/bin/env sh
cd "$( dirname "$0"; )"||exit;
export PATH="..:$PATH";
SCRIPT=cdeps;

if test -n "$( cdeps ./cdeps-a.h; )"; then
  echo "$SCRIPT: incorrectly listed dependencies for cdeps-a.h" > /dev/stderr;
  exit 1;
fi

if test -n "$( cdeps ./cdeps-b.h; )"; then
  echo "$SCRIPT: incorrectly listed dependencies for cdeps-b.h" > /dev/stderr;
  exit 1;
fi

if test "$( cdeps ./cdeps-c.h|wc -l; )" != 1; then
  echo "$SCRIPT: detected the wrong number of dependencies for cdeps-c.h"  \
       > /dev/stderr;
  printf "%s" "Got $( cdeps ./cdeps-c.h|wc -l; ) lines." > /dev/stderr;
  exit 1;
fi

if cdeps ./cdeps-c.h|grep -v '^cdeps-a.h'; then
  cdeps ./cdeps-c.h;
  echo "$SCRIPT: failed to detect cdeps-a.h dependency of cdeps-c.h"  \
       > /dev/stderr;
  exit 1;
fi
