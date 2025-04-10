#!/bin/bash

# 临时输出文件
tmp_file=hv_output.txt
# 测试成功标志
grep_content="Shutdown vm normally!"

# 进入arceos目录
cd arceos/ || exit

# 准备测试环境（根据图片提示）
make payload
./update_disk.sh payload/skernel2/skernel2

# 运行测试（启用块设备支持）
make run A=exercises/simple_hv/ BLK=y > $tmp_file 2>/dev/null

# 检查输出最后一行是否包含成功标志
output=$(tail -n1 ./$tmp_file | grep -a "$grep_content")

# 清理临时文件
rm -rf $tmp_file 

# 判断测试结果
if [[ -z "$output" ]]; then
    echo "simple_hv 测试不通过"
    exit 1
else 
    echo "simple_hv 测试通过"
    exit 0
fi
