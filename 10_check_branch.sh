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
    cd $code_dir/$path > /dev/null; branch_name=`git branch --show-current`; if [ "$branch_name" != "$version" ]; then echo $path ; fi ; cd - > /dev/null

done  < name_path.txt
