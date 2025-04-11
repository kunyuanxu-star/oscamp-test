#!/bin/bash


tmp_file=c.txt
grep_content="Bump tests run OK!"

cd arceos/ || exit


rm pflash.img
rm disk.img

make pflash_img
make disk_img


make A=exercises/alt_alloc/ run > $tmp_file 2>/dev/null

output=$(tail -n1 ./$tmp_file | grep -a "$grep_content")

# 避免环境污染
rm -rf $tmp_file 

if [[ -z "$output" ]] ;then
    echo "alt_alloc 不通过"
    exit 1
else 
    echo "alt_alloc 通过"
    exit 0
fi