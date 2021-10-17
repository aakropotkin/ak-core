#! /usr/bin/env sh
export PATH=$( realpath -s ..; ):$PATH;
SCRIPT=is-elf-cu;
for obj in hello.o howdy.o greet.o; do
  test -f $obj || echo "can't find $obj";
  if $SCRIPT $obj; then
    exit 0;
  else
    echo "$SCRIPT: failed with false negative for $obj" >&2;
    exit 1;
  fi
done
