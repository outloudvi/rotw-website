#/bin/bash

git clone https://git.oschina.net/crlf/reviewotw.git

cp CNAME ./reviewotw
cp index.html ./reviewotw
cp *.sh ./reviewotw
cd reviewotw
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
surge --project . --domain rotw.surge.sh