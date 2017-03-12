#/bin/bash

git clone https://git.oschina.net/crlf/reviewotw.git
cp CNAME ./reviewotw
cp parsemd.sh ./reviewotw
cp perpage.sh ./reviewotw
cp update.sh ./reviewotw
cp README.md ./reviewotw
cp index.html ./reviewotw
cd reviewotw

npm install -g marked
marked -i README.md -O readme.html
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

npm install -g surge
surge --project=. --domain rotw.surge.sh