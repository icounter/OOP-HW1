#problem 3
allnames="XOM GOOG AAPL IBM JNJ HOG BAC JPM MSFT MMM SPY DIA"
echo "Total number of sell orders of each stock"
for name in $allnames
do
    if [ ! -d $name ]
    then
        mkdir $name
        cd $name
        touch \<$name\>_20130124.txt
        cd ..
        grep -E "\s$name\s" S20130124_subset.txt > ./$name/\<$name\>_20130124.txt
    fi
    echo -n "$name "
    grep -E '^[AF]\s[0-9]+\s[0-9]+\sS' ./$name/\<$name\>_20130124.txt | wc -l
done
#problem 4 
for name in $allnames
do
    echo -n "$name " >> stock_activity_rank.txt
    wc -l < ./$name/\<$name\>_20130124.txt >> stock_activity_rank.txt
done
echo -n "The most active stock of the list is: "
sort -k2 -n -r stock_activity_rank.txt | head -n 1 | cut -d' ' -f1
rm stock_activity_rank.txt #remove the txt file that was used to sort the most active stock
