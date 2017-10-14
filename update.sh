#!/bin/bash

git clone $REPO_SRC

cp CNAME $REPO_NAME
cp index.html $REPO_NAME
cp -R assets $REPO_NAME
node run.js