#! /usr/bin/env bats
# -*- mode: bats; -*-
# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

# bats file_tags=ccjs

load setup_suite.bash;

# ---------------------------------------------------------------------------- #

setup() {
  mkdir -p "$BATS_TEST_TMPDIR";
  pushd "$BATS_TEST_TMPDIR" > /dev/null 2>&1||return;
  # Mark the project root directory.
  touch .root;
  refute "$TEST" -f compile_commands.json;
}

teardown() {
  popd > /dev/null 2>&1||return;
  $RM -r "$BATS_TEST_TMPDIR";
}


# ---------------------------------------------------------------------------- #

# bats test_tags=usage
@test "ccjs usage" {
  run "$CCJS" -u;
  assert_success;
  assert_output --partial 'USAGE:';

  run "$CCJS" --usage;
  assert_success;
  assert_output --partial 'USAGE:';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=help
@test "ccjs help" {
  run "$CCJS" -h;
  assert_success;
  assert_output --partial 'USAGE:';

  run "$CCJS" --help;
  assert_success;
  assert_output --partial 'USAGE:';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=usage,ccjs:add
@test "ccjs add usage" {
  run "$CCJS" add -u;
  assert_success;
  assert_output --partial 'USAGE:';

  run "$CCJS" add --usage;
  assert_success;
  assert_output --partial 'USAGE:';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=help,ccjs:add
@test "ccjs add help" {
  run "$CCJS" add -h;
  assert_success;
  assert_output --partial 'USAGE:';

  run "$CCJS" add --help;
  assert_success;
  assert_output --partial 'USAGE:';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=usage,ccjs:remove
@test "ccjs remove usage" {
  run "$CCJS" remove -u;
  assert_success;
  assert_output --partial 'USAGE:';

  run "$CCJS" remove --usage;
  assert_success;
  assert_output --partial 'USAGE:';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=help,ccjs:remove
@test "ccjs remove help" {
  run "$CCJS" remove -h;
  assert_success;
  assert_output --partial 'USAGE:';

  run "$CCJS" remove --help;
  assert_success;
  assert_output --partial 'USAGE:';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add,init
@test "create a new compile_commands.json" {
  run "$CCJS" add main.cc;
  assert_success;
  refute "$TEST" -f compile_commands.json;

  echo "$output" > ./compile_commands.json;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  run "$JQ" -r '.[0].file' compile_commands.json;
  assert_success;
  assert_output "$PWD/main.cc";

  run "$JQ" -r '.[0].directory' compile_commands.json;
  assert_success;
  assert_output "$PWD";

  run "$JQ" -r '.[0].output' compile_commands.json;
  assert_success;
  assert_output "$PWD/main.o";

  run "$JQ" -r '.[0].arguments|length' compile_commands.json;
  assert_success;
  assert_output '0';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add
@test "'ccjs add' without '-i' does not edit compile_commands.json" {
  $CCJS add -i main.cc;
  assert "$TEST" -f compile_commands.json;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  unset output;
  run "$CCJS" add foo.cc;
  assert_success;
  # Dump to junk file without modifying the original
  echo "$output" > ./compile_commands.json~;
  run "$JQ" -r 'length' compile_commands.json~;
  assert_success;
  assert_output '2';

  # Original is unchanged
  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add,init,inline
@test "create a new compile_commands.json with '-i'" {
  $CCJS add -i main.cc;
  $TEST -f compile_commands.json;
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add,init,inline
@test "'ccjs add' does not require files/directories to exist" {
  refute "$TEST" -d src;
  $CCJS add -i src/main.cc;
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add,init,inline
@test "'ccjs add FILE -- ARGS...' has correct fallbacks" {
  $CCJS add -i src/main.cc -- -Iinclude -Wall;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  run "$JQ" -r '.[0].file' compile_commands.json;
  assert_success;
  assert_output "$PWD/src/main.cc";

  run "$JQ" -r '.[0].directory' compile_commands.json;
  assert_success;
  assert_output "$PWD";

  run "$JQ" -r '.[0].output' compile_commands.json;
  assert_success;
  assert_output "$PWD/src/main.o";

  run "$JQ" -r '.[0].arguments|length' compile_commands.json;
  assert_success;
  assert_output '2';

  run "$JQ" -r '.[0].arguments[0]' compile_commands.json;
  assert_success;
  assert_output '-Iinclude';

  run "$JQ" -r '.[0].arguments[1]' compile_commands.json;
  assert_success;
  assert_output '-Wall';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add,inline,multiple
@test "'ccjs add' multiple times appends file" {
  $CCJS add -i src/main.cc -- -Iinclude -Wall;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  $CCJS add -i src/helper.cc -- -Iinclude -Wall;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '2';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add,inline,multiple
@test "'ccjs add' updates existing file" {
  "$CCJS" add -i src/main.cc -- -Iinclude -Wall;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  run "$JQ" -r '.[0].arguments|length' compile_commands.json;
  assert_success;
  assert_output '2';

  run "$JQ" -r '.[0].arguments[0]' compile_commands.json;
  assert_success;
  assert_output '-Iinclude';

  run "$JQ" -r '.[0].arguments[1]' compile_commands.json;
  assert_success;
  assert_output '-Wall';

  # Update the entry
  "$CCJS" add -i src/main.cc -- -I../include -Wall -Werror;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  run "$JQ" -r '.[0].arguments|length' compile_commands.json;
  assert_success;
  assert_output '3';

  run "$JQ" -r '.[0].arguments[0]' compile_commands.json;
  assert_success;
  assert_output '-I../include';

  run "$JQ" -r '.[0].arguments[1]' compile_commands.json;
  assert_success;
  assert_output '-Wall';

  run "$JQ" -r '.[0].arguments[2]' compile_commands.json;
  assert_success;
  assert_output '-Werror';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add,inline
@test "'ccjs add FILE OUTPUT -- ARGS...' works" {
  $CCJS add -i src/main.cc src/foo.o -- -Iinclude -Wall;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  run "$JQ" -r '.[0].file' compile_commands.json;
  assert_success;
  assert_output "$PWD/src/main.cc";

  run "$JQ" -r '.[0].directory' compile_commands.json;
  assert_success;
  assert_output "$PWD";

  run "$JQ" -r '.[0].output' compile_commands.json;
  assert_success;
  assert_output "$PWD/src/foo.o";

  run "$JQ" -r '.[0].arguments|length' compile_commands.json;
  assert_success;
  assert_output '2';

  run "$JQ" -r '.[0].arguments[0]' compile_commands.json;
  assert_success;
  assert_output '-Iinclude';

  run "$JQ" -r '.[0].arguments[1]' compile_commands.json;
  assert_success;
  assert_output '-Wall';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add,inline
@test "'ccjs add FILE OUTPUT DIRECTORY -- ARGS...' works" {
  $CCJS add -i src/main.cc src/foo.o "$PWD/src" -- -Iinclude -Wall;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  run "$JQ" -r '.[0].file' compile_commands.json;
  assert_success;
  assert_output "$PWD/src/main.cc";

  run "$JQ" -r '.[0].directory' compile_commands.json;
  assert_success;
  assert_output "$PWD/src";

  run "$JQ" -r '.[0].output' compile_commands.json;
  assert_success;
  assert_output "$PWD/src/foo.o";

  run "$JQ" -r '.[0].arguments|length' compile_commands.json;
  assert_success;
  assert_output '2';

  run "$JQ" -r '.[0].arguments[0]' compile_commands.json;
  assert_success;
  assert_output '-Iinclude';

  run "$JQ" -r '.[0].arguments[1]' compile_commands.json;
  assert_success;
  assert_output '-Wall';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add,inline
@test "'ccjs add FILE OUTPUT DIRECTORY ARGS...' works" {
  $CCJS add -i src/main.cc src/foo.o "$PWD/src" -Iinclude -Wall;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  run "$JQ" -r '.[0].file' compile_commands.json;
  assert_success;
  assert_output "$PWD/src/main.cc";

  run "$JQ" -r '.[0].directory' compile_commands.json;
  assert_success;
  assert_output "$PWD/src";

  run "$JQ" -r '.[0].output' compile_commands.json;
  assert_success;
  assert_output "$PWD/src/foo.o";

  run "$JQ" -r '.[0].arguments|length' compile_commands.json;
  assert_success;
  assert_output '2';

  run "$JQ" -r '.[0].arguments[0]' compile_commands.json;
  assert_success;
  assert_output '-Iinclude';

  run "$JQ" -r '.[0].arguments[1]' compile_commands.json;
  assert_success;
  assert_output '-Wall';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:remove,inline
@test "'ccjs remove' removes entry" {
  "$CCJS" add -i src/main.cc -- -Iinclude -Wall;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  "$CCJS" remove -i src/main.cc;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '0';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:remove,inline
@test "'ccjs remove' on non-existent entry is a no-op" {
  "$CCJS" add -i src/main.cc -- -Iinclude -Wall;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  "$CCJS" remove -i src/foo.cc;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:remove,inline,multiple
@test "'ccjs remove' takes multiple filenames" {
  "$CCJS" add -i src/main.cc -- -Iinclude -Wall;
  "$CCJS" add -i src/foo.cc -- -Iinclude -Wall;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '2';

  "$CCJS" remove -i src/foo.cc src/main.cc;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '0';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:remove
@test "'ccjs remove' without '-i' does not edit compile_commands.json" {
  "$CCJS" add -i src/main.cc -- -Iinclude -Wall;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  unset output;
  run "$CCJS" remove src/main.cc;
  assert_success;
  assert_output '[]';

  # Do not modify
  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
