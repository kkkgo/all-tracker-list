#!/bin/bash
mkdir download
touch download/temp.txt
touch trackerslist.txt
while read -r url; do
    curl -s "$url" >>download/temp.txt
    echo "" >>download/temp.txt
done <url.txt
cat trackerslist.txt >>download/temp.txt
sort -u download/temp.txt | grep "." >trackerslist.txt
rm -rf download
sha256sum trackerslist.txt | cut -d" " -f1 >trackerslist.txt.sha256sum
rm trackerslist.txt.xz
xz -9 -k -e trackerslist.txt
sha256sum trackerslist.txt.xz | cut -d" " -f1 >trackerslist.txt.xz.sha256sum