#!/bin/bash
# 测试函数是否成功执行

CMD="ls"
$CMD

if [ $? -eq 0 ];
then
	echo "$CMD executed successfully"
else
	echo "$CMD terminated unsuccessfully"
fi
