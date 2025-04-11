#!/bin/bash

tmp_file=hashmap_output.txt
grep_content="Memory tests run OK!"

cd arceos/ || exit


rm pflash.img
rm disk.img

make pflash_img
make disk_img


make run A=exercises/support_hashmap/ > $tmp_file 

output=$(tail -n1 ./$tmp_file | grep -a "$grep_content")

cat $tmp_file

# 清理临时文件
rm -rf $tmp_file 

if [[ -z "$output" ]]; then
    echo "support_hashmap 测试不通过"
    exit 1
else 
    echo "support_hashmap 测试通过"
    exit 0
fi
