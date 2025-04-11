#!/bin/bash

tmp_file=mmap_test_output.txt
# 修改为识别两种可能的成功输出格式
grep_content="\(Read back content: hello, arceos!\|\[Sys-Mmap\]: ok!\)"

cd arceos/ || exit

rm pflash.img
rm disk.img

make pflash_img
# make disk_img

# 添加BLK=y参数支持块设备
make run A=exercises/sys_map/ BLK=y > $tmp_file 2>/dev/null

# 检查输出中是否包含成功标识
output=$(grep -Ea "$grep_content" ./$tmp_file)

# 清理临时文件
rm -rf $tmp_file 

if [[ -z "$output" ]]; then
    echo "sys_mmap 测试不通过"
    # 添加调试信息：打印最后5行日志
    tail -n5 $tmp_file 2>/dev/null || echo "无输出日志"
    exit 1
else 
    echo "sys_mmap 测试通过"
    echo "成功输出内容：$output"
    exit 0
fi
