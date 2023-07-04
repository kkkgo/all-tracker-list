#!/bin/bash
mkdir download
touch download/temp.txt
touch trackerlist.txt
while read -r url; do
    curl -s "$url" >>download/temp.txt
    echo "" >>download/temp.txt
done <url.txt
cat trackerlist.txt >>download/temp.txt
sort -u download/temp.txt | grep "." >trackerlist.txt
rm -rf download
sha256sum trackerlist.txt | cut -d" " -f1 >trackerlist.txt.sha256sum
