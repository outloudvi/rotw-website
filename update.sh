#!/bin/bash

git clone $REPO_SRC

cp CNAME $REPO_NAME
cp index.html $REPO_NAME
mkdir $REPO_NAME/assets
cp -R assets/* $REPO_NAME/assets
node run.js