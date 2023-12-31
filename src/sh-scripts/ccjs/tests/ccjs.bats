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
  refute "$TEST" -f compile_commands.json;
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

# bats test_tags=ccjs:add,init,inline
@test "create a new compile_commands.json with '-i'" {
  refute "$TEST" -f compile_commands.json;
  run "$CCJS" add -i main.cc;
  assert_success;
  assert "$TEST" -f compile_commands.json;
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add,init,inline,missing
@test "'ccjs add' does not require files/directories to exist" {
  refute "$TEST" -d src;
  run "$CCJS" add -i src/main.cc;
  assert_success;
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add,init,inline
@test "'ccjs add FILE -- ARGS...' has correct fallbacks" {
  refute "$TEST" -f compile_commands.json;
  run "$CCJS" add -i src/main.cc -- -Iinclude -Wall;
  assert_success;

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
  refute "$TEST" -f compile_commands.json;
  run "$CCJS" add -i src/main.cc -- -Iinclude -Wall;
  assert_success;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '1';

  run "$CCJS" add -i src/helper.cc -- -Iinclude -Wall;
  assert_success;

  run "$JQ" -r 'length' compile_commands.json;
  assert_success;
  assert_output '2';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs:add,inline,multiple
@test "'ccjs add' updates existing file" {
  refute "$TEST" -f compile_commands.json;
  run "$CCJS" add -i src/main.cc -- -Iinclude -Wall;
  assert_success;

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
  run "$CCJS" add -i src/main.cc -- -I../include -Wall -Werror;
  assert_success;

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
#
#
#
# ============================================================================ #
