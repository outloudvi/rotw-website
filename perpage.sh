#!/bin/sh

cd $1
dest='index.html'

echo '[AddItem] Indexing '$1'...'
rm index.html
echo '<!DOCTYPE HTML><meta charset=utf-8><title>页面列表</title><ul>' >> $dest
for i in $(ls . | sed 's/.html//' | sed 's/index//' )
do
	echo '<li><a href="'$i'.html">'$i'</a></li>' >> $dest
done
echo '</ul>' >> $dest