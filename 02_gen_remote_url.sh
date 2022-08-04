#!/bin/sh

# set -e

if [[ "$code_dir" == "" ]]; then
    echo "please set code_dir in ENV"
    exit 1
fi

# cd path and git remote add
while read line
do
    # echo $line
    name=`echo $line | awk -F\| '{print $1}'`
    path=`echo $line | awk -F\| '{print $2}'`
    # echo $name
    # echo $path
    cd $code_dir/$path; git remote add openlinux-buildroot ssh://git@openlinux.amlogic.com/buildroot/$name; cd -
done  < name_path.txt

