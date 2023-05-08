#!/bin/sh

#set -e

source common.sh
env_judge

branch_name=""

# cd path and git remote add
while read line
do
    # echo $line
    name=`echo $line | awk -F\| '{print $1}'`
    path=`echo $line | awk -F\| '{print $2}'`
    branch_name=$version
    cd $code_dir/$path; git push openlinux-buildroot $branch_name; cd -
done  < name_path.txt

#cd $code_dir;repo forall -c "git push openlinux-buildroot $version"

