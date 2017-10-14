#!/bin/bash

git clone $REPO_SRC

cp CNAME $REPO_NAME
cp index.html $REPO_NAME
cp assets $REPO_NAME
cp *.sh $REPO_NAME
node run.js
node writejs.js