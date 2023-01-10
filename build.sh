#!/usr/bin/env bash

set -euo pipefail

name_tag=${1:?"missing docker image name:tag"}
artifact_dir="artifact/LinuxServer"
entry_script="server.sh"

if [[ ! -d "${artifact_dir}" ]]; then
    echo "artifact directory '${artifact_dir}' does not exist!"
fi

if [[ ! -f "${artifact_dir}/${entry_script}" ]]; then
    echo "server entry script '${artifact_dir}/${entry_script}' doesn not exist!"
fi

docker build -t "${name_tag}" .
