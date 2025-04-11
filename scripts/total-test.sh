#!/bin/bash

# 由于工作目录的原因. 请在workflow中指定从 根目录调用该脚本
score=0

# 执行习题 print color 测试
if ./scripts/test-print.sh ; then
    ((score += 100))
fi

# # 执行习题 ramfs_rename 测试
# if ./scripts/test-ramfs_rename.sh ; then
#     ((score += 100))
# fi

# 执行习题 alt_alloc 测试
if ./scripts/test-alt_alloc.sh ; then
    ((score += 100))
fi

if ./scripts/test-support_hashmap.sh ; then
    ((score += 100))
fi

# if ./scripts/test-sys_map.sh ; then
#     ((score += 100))
# fi

# if ./scripts/test-simple_hv.sh ; then
#     ((score += 100))
# fi

echo $score