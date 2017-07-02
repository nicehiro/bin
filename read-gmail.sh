#!/bin/bash
# read email from gmail
# 1. 将源代码中的换行符删除
# 2. 提取 title、author、from 信息
# 3. 显示最多 5 条邮件

username=wfy11235813@gmail.com
password=11235813wfy

SHOW_COUNT=5

echo

curl -u $username:$password --silent "https://mail.google.com/mail/feed/atom" | \
	tr -d '\n' | sed 's:</entry>:\n:g' | \
	sed 's/.*<title>\(.*\)<\/title.*<author><name>\([^<]*\)<\/name><email>\([^<]*\).*/From: \2 [\3] \nSubject: \1\n/p' | \
	head -n $(( $SHOW_COUNT * 3 ))
