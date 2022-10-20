#!/bin/bash

HERE="$(pwd)"
VERSION="set(PACKAGE_VERSION "
VERSION_SCRIPT="$HERE/Version/version.sh"

if ! test -e "$VERSION_SCRIPT"; then

  echo "ERROR: The version script was not found at path: '$VERSION_SCRIPT'"
  exit 1
fi

# shellcheck disable=SC1090
. "$VERSION_SCRIPT"

PC_FILE="/usr/local/lib/cmake/GTest/GTestConfigVersion.cmake"
if ! test -e "$PC_FILE"; then

  PC_FILE="/usr/local/lib64/cmake/GTest/GTestConfigVersion.cmake"
fi

# shellcheck disable=SC2002
RAW="$(test -e "$PC_FILE" && cat "$PC_FILE" | grep "$VERSION")" && \
  echo "${RAW/$VERSION/}" | xargs | cut -f1 -d")" | xargs