#!/bin/bash
# remove the same file and keep one
# ls 将文件按文件大小排列，所以如果当前文件和上一个文件的 md5 不相同，那么肯定不会有文件和上一个文件相同
# 所以每次只需要更新 size 和 name1 与当前文件比较 

ls -lS --time-style=long-iso | awk 'BEGIN {
  getline; getline;
  name1=$8; size=$5;
} {
  name2=$8;
  if (size==$5)
  {
    "md5sum "name1 | getline; csum1=$1;
    "md5sum "name2 | getline; csum2=$1;
    if (csum1==csum2)
    {
      print name1; print name2
	}
  };

  size=$5; name1=name2;
}' | sort -u > duplicate_files

cat duplicate_files | xargs -I {} md5sum {} | sort | uniq -w 32 | awk '{ print "^"$2"$" }' | sort -u > duplicate_sample

echo Resolving...
comm duplicate_files duplicate_sample -2 -3 | tee /dev/stderr | xargs rm
echo Removed duplicates files successfully.
