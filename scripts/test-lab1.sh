#!/bin/bash

TMP_FILE=g.txt
TIMEOUT_DURATION=20


# 工作目录的原因,这个得在ci设置为arceos目录下运行

timeout --foreground ${TIMEOUT_DURATION}s ./verify_lab1.sh >"$TMP_FILE" 2>/dev/null
exit_code=$?

# echo "timeout exit_code = $exit_code"

if [ "$exit_code" -eq 124 ]; then
    score=99999
else
    score=$(grep "Indicator:" $TMP_FILE | tail -n1 | sed -E 's/.*Indicator: ([0-9]+).*/\1/')
    # echo "得分为: $score"

    score=${score:-0}
fi

rm $TMP_FILE

echo "得分为: $score"

# echo "lab1_points=$score" >>"$GITHUB_OUTPUT"
