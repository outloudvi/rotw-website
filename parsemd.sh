#!/bin/sh

cd $1

for i in $(ls . | sed 's/index.htm//' | sed 's/.md//' )
do
    marked -i $i.md -o $i.html
    rm $i.md
done