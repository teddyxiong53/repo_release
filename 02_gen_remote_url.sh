#!/bin/sh

# set -e

source common.sh
env_judge

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

