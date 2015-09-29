#!/bin/bash
#S20130124_subset.txt needs to be doadloaded in advance
#type ./MTH9815HW01Q2.sh "symbol" when using the code
mkdir -p $1
cd $1
touch \<$1\>_20130124.txt
cd ..
grep -E "\s$1\s" S20130124_subset.txt > ./$1/\<$1\>_20130124.txt

