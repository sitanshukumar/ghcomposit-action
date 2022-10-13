#!/bin/bash

set -e

_tmp_file=$(ls "${INPUT_PROJECTBASEDIR}/" | head -1)
PERM=$(stat -c "%u:%g" "${INPUT_PROJECTBASEDIR}/$_tmp_file")

chmod -R 777 $PERM "${INPUT_PROJECTBASEDIR}/"
