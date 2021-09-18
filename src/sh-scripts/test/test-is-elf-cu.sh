#! /usr/bin/env sh
echo "PWD: $PWD";
echo "srcdir: $srcdir";
SCRIPT=$srcdir/../is-elf-cu;
for obj in hello.o howdy.o greet.o; do
  if $SCRIPT $srcdir/$obj; then
    exit 0;
  else
    echo "$SCRIPT: failed with false negative for $obj" >&2;
    exit 1;
  fi
done
