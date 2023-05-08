#!/bin/sh

set -e

source common.sh
env_judge

python3 gen_remote_url.py $code_dir

# post process, remove some projects, like freertos
