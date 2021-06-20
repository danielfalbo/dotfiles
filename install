#! /usr/bin/env bash

set -e

CONFIG="install.conf.yaml"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"

python3 -m venv .venv
source .venv/bin/activate

python -m pip install --upgrade pip

pip install -r requirements.txt

dotbot -d "${BASEDIR}" -c  "${CONFIG}" "${@}"

deactivate