#! /usr/bin/env bash
# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

#set -eu;
#set -o pipefail;


# ---------------------------------------------------------------------------- #

bats_load_library bats-support
bats_load_library bats-assert
bats_require_minimum_version '1.5.0'


# ---------------------------------------------------------------------------- #

# print_vars VARIABLE
# -------------------
# Print the value of VARIABLE to a user visible file descriptor.
print_var() {
  local var="$1";
  local val;
  eval val="\$$var";
  echo "$var='$val'" >&3;
}


# ---------------------------------------------------------------------------- #

# Programs
# --------

# A list of programs used by the test suite.
declare -a _bats_test_progs;
_bats_test_progs=();

# Print the value of each program.
print_progs() {
  for prog in "${_bats_test_progs[@]}"; do
    print_var "$prog";
  done
}

# Setup common programs as user overridable variables.
progs_setup() {
  if [[ -z "${_RAN_PROGS_SETUP:-}" ]]; then
    : "${MKDIR:=mkdir}";
    : "${MKDIR_P:=$MKDIR -p}";
    : "${REALPATH:=realpath}";
    : "${RM:=rm -f}";
    : "${TEST:=test}";
    : "${TRUE:=:}";
    : "${FALSE:=false}";
    : "${JQ:=jq}";
    : "${REALPATH:=realpath}";
    : "${MKTEMP:=mktemp}";
    : "${GREP:=grep}";
    : "${SED:=sed}";
    : "${SORT:=sort}";
    : "${TR:=tr}";
    : "${WC:=wc}";
    : "${XARGS:=xargs}";
    : "${FIND:=find}";

    _bats_test_progs+=(
      MKDIR MKDIR_P REALPATH RM TEST TRUE FALSE JQ REALPATH MKTEMP GREP SED SORT
      TR WC XARGS FIND
    );

    for prog in "${_bats_test_progs[@]}"; do
      eval "export $prog";
    done

    print_progs;
  fi
  export _RAN_PROGS_SETUP=1;
}


# ---------------------------------------------------------------------------- #

ccjs_setup() {
  if [[ -z "${_RAN_CCJS_SETUP:-}" ]]; then
    progs_setup;
    : "${CCJS:=$( $REALPATH "${BASH_SOURCE[0]%/*}/../main.bash"; )}";
    export CCJS;
    print_var CCJS;
  fi
  export _RAN_CCJS_SETUP=1;
}


# ---------------------------------------------------------------------------- #

setup_suite() {
  progs_setup;
  ccjs_setup;
}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
