#!/bin/bash

. ./hack/prepare-env.sh

[ "$NOVENV" == "1" ] || prepare_venv || exit 1

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

for directory in ${SCRIPT_DIR}/.. $directories; do
    pushd "$directory"
    $PYTHON_VENV_DIR/bin/radon mi -s -i venv .
    popd
done
