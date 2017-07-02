#!/bin/bash
# define a word from dictionaryapi
# 从 merriam-webster 网站使用字典的 api 对字词进行解释
# 使用 grep 将网页中所有的 <dt> 标签里的数据筛出来，一个 dt 成一行
# 使用 sed 将所有的 <> 标签删掉

apikey=6e6674b6-8a1b-4074-8fa4-7c253e8fcbd3

if [ $# -ne 2 ];
then
	echo -e "Usage: $0 word number"
	exit -1
fi

curl --silent http://www.dictionaryapi.com/api/v1/references/learners/xml/$1?key=$apikey | \
	grep -o \<dt\>.*\</dt\> | \
	sed 's$</*[a-z]*>$$g' | \
	head -n $2 | nl
