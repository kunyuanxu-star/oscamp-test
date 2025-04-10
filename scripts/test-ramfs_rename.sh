#!/bin/bash


tmp_file=b.txt
grep_content="\[Ramfs-Rename\]: ok!"

cd arceos/ || exit

make run A=exercises/ramfs_rename/ BLK=y > $tmp_file 2>/dev/null

output=$(tail -n1 ./$tmp_file | grep -a "$grep_content")

# 避免环境污染
rm -rf $tmp_file 

if [[ -z "$output" ]] ;then
    echo "ramfs_rename 不通过"
    exit 1
else 
    echo "ramfs_rename 通过"
    exit 0
fi