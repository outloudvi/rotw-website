#!/bin/bash

REPO_SRC="https://git.oschina.net/crlf/reviewotw.git"
#REPO_SRC="https://github.com/outloudvi/reviewotw.git"
REPO_NAME="reviewotw"
SURGE_TARGET="rotw.surge.sh"

git clone $REPO_SRC

cp CNAME $REPO_NAME
cp index.html $REPO_NAME
cp *.sh $REPO_NAME
node run.js
cd $REPO_NAME
./addmeta.sh
rm -rf .git/ addmeta.sh
surge --project . --domain $SURGE_TARGET