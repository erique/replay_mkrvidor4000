#!/bin/bash

wget -r -np -nH --cut-dirs=3 -e robots=off -A "latest" https://build.fpgaarcade.com/releases/cores/V4/ -P sdcard
for core in `find . -type f -name "latest" -print0 | xargs -0 -L1 dirname`
do
	pushd $core && 7z -y x latest && rm latest && popd
done
pushd sdcard && mv loader/* . && rm -r loader && popd
