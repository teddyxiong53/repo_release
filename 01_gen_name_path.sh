#!/bin/sh

set -e

usage() {
    echo "
example:
export code_dir=/home/hanliang.xiong/work/a113l2/code
export xml_file=buildroot-openlinux-202305-a113l2-ba400-spk.xml
export version=buildroot-openlinux-202305-a113l2-ba400-spk"
}
if [ "$code_dir" == "" -o "$xml_file" == "" -o "$version" == ""  ]; then
    usage
    exit 1
fi

python3 gen_remote_url.py $code_dir

# post process, remove some projects, like freertos
