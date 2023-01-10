#!/usr/bin/env bash

set -euo pipefail

name_tag=${1:?"missing docker image name:tag"}
artifact_dir="artifact/LinuxServer"
entry_script="server.sh"

if [[ ! -d "${artifact_dir}" ]]; then
    echo "artifact directory '${artifact_dir}' does not exist!"
    exit 1
fi

if [[ ! -f "${artifact_dir}/${entry_script}" ]]; then
    echo "server entry script '${artifact_dir}/${entry_script}' doesn not exist!"
    exit 1
fi

docker build -t "${name_tag}" .

cat <<TEXT

successfully built docker image: ${name_tag}

to test:

docker run --rm -ti -p 7777:7777/udp ${name_tag}

TEXT
