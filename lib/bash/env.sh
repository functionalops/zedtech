#!/usr/bin/env bash
# Purpose: provide minimal shared environment setup for zedtech bash scripts

function z_env_setup_environment() {
  declare -xr Z_TMP="${Z_TMP:-/tmp}"
  # declare -xr Z_ETC="$Z_HOME/etc"
  # declare -xr Z_VAR="${Z_VAR:-$Z_HOME/var}"
  # declare -xr Z_ENV="${Z_ENV:-dev}"
  # declare -xr Z_PLATFORM="$(uname -s)"
  . $Z_BASH_LIB/bash.functions
}

function z_env_test_environment() {
  if [ ! -d "$Z_HOME" -o ! -d "$Z_LIB" ]; then
    >&2 echo "Error: Z_HOME (${Z_HOME}) and Z_LIB ($Z_LIB) are not directories"
  fi
}

if [ "${BASH_SOURCE[0]}" != "$0" ]; then
  z_env_setup_environment
  z_env_test_environment
else
  >&2 echo "Error: executing ${0} intended to be sourced...nothing to do."
  exit 1
fi
