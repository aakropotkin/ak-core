#! /usr/bin/env sh
SCRIPT=is-elf-cu;
for obj in hello.o howdy.o greet.o; do
  if ! is-elf-cu $obj; then
    echo "$SCRIPT: failed with false negative for $obj" >&2;
    exit 1;
  fi
done
