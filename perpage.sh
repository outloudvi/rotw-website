#!/bin/sh

cd $1
dest='./index.htm'

echo '[AddItem] Indexing...'
#base-generate.sh $1
rm $1/index.htm
for i in $(ls .)
do
	echo '<li><a href="'$i'">'$i'</a></li>' >> $dest
done
