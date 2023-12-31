#! /usr/bin/env bats
# -*- mode: bats; -*-
# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

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

# bats test_tags=ccjs,usage
@test "ccjs usage" {
  run "$CCJS" -u;
  assert_success;
  assert_output --partial 'USAGE:';

  run "$CCJS" --usage;
  assert_success;
  assert_output --partial 'USAGE:';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs,help
@test "ccjs help" {
  run "$CCJS" -h;
  assert_success;
  assert_output --partial 'USAGE:';

  run "$CCJS" --help;
  assert_success;
  assert_output --partial 'USAGE:';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs,usage,ccjs_add
@test "ccjs add usage" {
  run "$CCJS" add -u;
  assert_success;
  assert_output --partial 'USAGE:';

  run "$CCJS" add --usage;
  assert_success;
  assert_output --partial 'USAGE:';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs,help,ccjs_add
@test "ccjs add help" {
  run "$CCJS" add -h;
  assert_success;
  assert_output --partial 'USAGE:';

  run "$CCJS" add --help;
  assert_success;
  assert_output --partial 'USAGE:';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs,usage,ccjs_remove
@test "ccjs remove usage" {
  run "$CCJS" remove -u;
  assert_success;
  assert_output --partial 'USAGE:';

  run "$CCJS" remove --usage;
  assert_success;
  assert_output --partial 'USAGE:';
}


# ---------------------------------------------------------------------------- #

# bats test_tags=ccjs,help,ccjs_remove
@test "ccjs remove help" {
  run "$CCJS" remove -h;
  assert_success;
  assert_output --partial 'USAGE:';

  run "$CCJS" remove --help;
  assert_success;
  assert_output --partial 'USAGE:';
}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
