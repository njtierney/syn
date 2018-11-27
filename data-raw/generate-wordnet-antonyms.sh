#!/bin/sh
./generate-wordnet-antonyms.py > wordnet-antonyms-raw.txt
cat wordnet-antonyms-raw.txt | sort | uniq > wordnet-antonyms-cleaned.txt
