#!/bin/bash
# 统计词频
# awk 中的 $0 是指每一行的文本内容
# egrep 的 -o 是指输出为每一行

if [ $# -ne 1 ];
then
	echo "Usage: $0 filename";
	exit -1
fi

filename=$1

egrep -o "\b[[:alpha:]]+\b" $filename | \

awk '{ count[$0]++ }
END{ printf("%-14s%s\n", "word", "Count") ;
for(ind in count)
{
  printf("%-14s%d\n", ind, count[ind]); }
}'
