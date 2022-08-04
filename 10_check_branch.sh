#!/bin/sh

set -e

if [[ "$code_dir" == "" ]]; then
    echo "please set code_dir in ENV"
    exit 1
fi

if [[ "$version" == "" ]]; then
    echo "please set version in ENV"
    exit 1
fi

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
