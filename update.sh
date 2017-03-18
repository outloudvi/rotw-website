#/bin/bash

REPO_SRC="https://git.oschina.net/crlf/reviewotw.git"
#REPO_SRC="https://github com/outloudvi/reviewotw.git"
REPO_NAME="reviewotw"
SURGE_TARGET="rotw.surge.sh"

git clone $REPO_SRC

cp CNAME $REPO_NAME
cp index.html $REPO_NAME
cp *.sh $REPO_NAME
cd $REPO_NAME
chmod +x *.sh

marked -i README.md -o readme.html
./parsemd.sh bio
./parsemd.sh ch
./parsemd.sh che
./parsemd.sh en
./parsemd.sh ma
./parsemd.sh phy
./parsemd.sh w2a
./parsemd.sh wen/his
./perpage.sh bio
./perpage.sh ch
./perpage.sh che
./perpage.sh en
./perpage.sh ma
./perpage.sh phy
./perpage.sh w2a
./perpage.sh wen/his
./addmeta.sh
rm -rf .git/
surge --project . --domain $SURGE_TARGET