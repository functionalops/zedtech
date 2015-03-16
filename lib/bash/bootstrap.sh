#!/usr/bin/env bash
# Purpose: provide a library of reusable bash related functions

function z_path_add() {
  local -r directory="$1"
  local -r current_path="$PATH"
  if [ -z "$current_path" ]; then
    export "PATH=$directory"
  else
    if ! echo "$PATH" | grep -- "$directory" >/dev/null 2>&1; then
      export "PATH=$directory:$PATH"
    fi
  fi
}


if [ "${BASH_SOURCE[0]}" != "$0" ]; then
  if [ -z "$Z_HOME" ]; then
    export -r Z_HOME=$(dirname $(dirname $(dirname $0)))
    export -r Z_BIN=${Z_HOME}/bin
    export -r Z_LIB=${Z_HOME}/lib
    export -r Z_BASH_LIB=${Z_LIB}/bash
    alias cd-="cd $Z_HOME"
    alias cdb="cd $Z_BIN"
    alias cdl="cd $Z_LIB"
    z_path_add $Z_BIN
  fi
else
  # I want to make sure we report to stderr that a library script that expects
  # to be sourced by another script is being executed, not just sourced. Can
  # also aid in debugging issues with your script.
  >&2 echo "Error: executing ${0} intended to be sourced...nothing to do."
  exit 1
fi
