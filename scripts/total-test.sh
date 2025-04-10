#!/bin/bash

# 由于工作目录的原因. 请在workflow中指定从 根目录调用该脚本
score=0

# 执行习题一测试
if ./scripts/test-print.sh ; then
    ((score += 100))
fi

echo $score