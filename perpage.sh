#!/bin/sh

cd $1
dest='./index.htm'

echo '[AddItem] Indexing $1...'
#base-generate.sh $1
cd $1
rm index.htm
echo '<!DOCTYPE HTML><meta charset=utf-8><title>页面列表</title><ul>' >> $dest
for i in $(ls . | sed 's/.html//')
do
	echo '<li><a href="$i.html">$i</a></li>' >> $dest
done
echo '</ul>' >> $dest
