#!/bin/bash

cd arceos/ || exit

make run A=exercises/print_with_color/ > a.txt 2>/dev/null

output=$(tail -n1 ./a.txt | grep -a "$(printf '\x1b')")

# 避免环境污染
rm a.txt

if [[ -z "$output" ]] ;then
    # echo "无颜色输出"
    exit 1
else 
    # echo "含有颜色输出"
    exit 0
fi