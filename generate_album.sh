#!/bin/bash
# generate album
# 先把 html 的 body 前面的信息写进去
# 在把每个图片转换成 url 写到 html 里
# 最后写 html 页脚

echo "Creating album..."
mkdir -p thumbs
cat <<EOF1 > index.html
<html>
<head>
<style>

body
{
  width:470px;
  margin:auto;
  border: 1px dashed grey;
  padding:10dp;
}

img
{
  margin: 5px;
  border: 1px solid black;
}

</style>
</head>
<body>
<center><h1> #Album title </h1></center>
<p>
EOF1

for img in *.png;
do
	convert "$img" -resize "100x" "thumbs/$img"
	echo "<a href=\"$img\" ><img src=\"thumbs/$img\" title=\"$img\" /></a>" >> index.html
done

cat <<EOF2 >> index.html
</p>
</body>
</html>
EOF2

echo Album generated to index.html
