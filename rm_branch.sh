#!/bin/sh

set -e

code_dir=`pwd`/pure_code/

# gen name and path
if [ ! -f name_path.txt ]; then
    python3 gen_remote_url.py $code_dir
fi
if [ ! -f toolchain_name_path.txt ]; then
    echo "no toolchain_name_path.txt "
    exit 1
fi
version=buildroot-openlinux-202104

# cd path and git remote add 
while read line
do
    # echo $line
    name=`echo $line | awk -F\| '{print $1}'`
    path=`echo $line | awk -F\| '{print $2}'`
    # echo $name
    # echo $path
    cd $code_dir/$path; git checkout master; git branch -d $version;  cd -
    # git push openlinux-buildroot $version;
done  < toolchain_name_path.txt

