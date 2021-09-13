#! /usr/bin/env sh
export PATH=..:$PATH;
SCRIPT=cdeps;

if test -n "$( cdeps ./cdeps-a.h; )"; then
  echo "$SCRIPT: incorrectly listed dependencies for cdeps-a.h" >&2;
  exit 1;
fi

if test -n "$( cdeps ./cdeps-b.h; )"; then
  echo "$SCRIPT: incorrectly listed dependencies for cdeps-b.h" >&2;
  exit 1;
fi

if test "$( cdeps ./cdeps-c.h|wc -l; )" != 1; then
  echo "$SCRIPT: detected the wrong number of dependencies for cdeps-c.h" >&2;
  printf "Got $( cdeps ./cdeps-c.h|wc -l; ) lines." >&2;
  exit 1;
fi

if cdeps ./cdeps-c.h|grep -v '^cdeps-a.h'; then
  cdeps ./cdeps-c.h;
  echo "$SCRIPT: failed to detect cdeps-a.h dependency of cdeps-c.h" >&2;
  exit 1;
fi
