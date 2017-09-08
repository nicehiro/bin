#!/bin/bash
# convert .md to .org
# It's simpler if you just find .md file and don't convert it to .org file at first. I do this just because I want to prictice awk function

if [ $# -ne 2 ];
then
	  echo -e "Usage: $0 MDFileLoaction ORGFileLocation"
	  exit -1
fi

ls -lS --time-style=long-iso $1 | awk 'BEGIN {
   getline; getline;
   name=$8;
}
{
  if (match(name, "\.md$"))
  {
    temp=name;
    sub(/md/, "org", temp);
    print temp;
  }
  name=$8;
}' | while read line
do
    mdfilename=${line/org/md};
    pandoc ${1}/${mdfilename} -s -o ${2}/${line};
    echo ${1}/${line}
done

