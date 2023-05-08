#!/bin/sh

set -e

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

    # echo $branch_name
    cd $code_dir/$path; git checkout -b $branch_name;  cd -
    # cd $code_dir/$path; git branch -d $branch_name;  cd -
done  < name_path.txt

