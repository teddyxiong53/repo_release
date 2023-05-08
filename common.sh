#!/bin/bash
usage() {
    echo "
需要设置code_dir、xml_file、version这3个环境变量。
举例:
export code_dir=/home/hanliang.xiong/work/a113l2/code
export xml_file=buildroot-openlinux-202305-a113l2-ba400-spk.xml
export version=buildroot-openlinux-202305-a113l2-ba400-spk"
}

env_judge() {
    if [ "$code_dir" == "" -o "$xml_file" == "" -o "$version" == ""  ]; then
        usage
        exit 1
    fi
}

