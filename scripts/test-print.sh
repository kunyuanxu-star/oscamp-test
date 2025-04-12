#!/bin/bash

cd arceos/ || exit

rm pflash.img -f 
rm disk.img -f

make pflash_img
make disk_img


make run A=exercises/print_with_color/ > a.txt 2>/dev/null

output=$(tail -n1 ./a.txt | grep -a "$(printf '\x1b')")

rm a.txt -f

if [[ -z "$output" ]] ;then
    echo "print_with_color 不通过"
    exit 1
else 
    echo "print_with_color 通过"
    exit 0
fi