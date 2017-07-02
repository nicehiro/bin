#!/bin/bash
# 生成延迟

echo -n Count:
# 存储光标位置
tput sc

count=0;
while true;
do
	if [ $count -lt 40 ];
	then
		let count++;
		sleep 1;
		# 恢复光标位置
		tput rc
		# 清除光标到末尾的所有字符
		tput ed
		echo -n $count;
	else exit 0;
	fi
done
