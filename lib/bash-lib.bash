#!/usr/bin/env bash

# Activate bash-lib (https://github.com/aks/bash-lib#usage)
BASH_LIB_PARENT_DIR="$(readlink --canonicalize-existing "${BASH_SOURCE[0]%/*}")"
export PATH="${PATH:+${PATH}:}${BASH_LIB_PARENT_DIR}/bash"
unset BASH_LIB_PARENT_DIR
source bash-lib.sh
