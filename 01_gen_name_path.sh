#!/bin/sh

set -e


if [[ "$code_dir" == "" ]]; then
    echo "please set code_dir in ENV"
    exit 1
fi

python3 gen_remote_url.py $code_dir

# post process, remove some projects, like freertos
