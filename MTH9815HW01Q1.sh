#!/bin/bash
allmembers="AAPL AXP BA CAT CSCO CVX DD DIS GE GS HD IBM INTC JNJ JPM KO MCD MMM MRK MSFT NKE PFE PG TRV UNH UTX V VZ WMT XOM"
for member in $allmembers
do
    curl -o $member.csv "https://www.quandl.com/api/v3/datasets/YAHOO/$member.csv?start_date=2015-08-03&end_date=2015-08-31"
done
cat AAPL.csv | sort | cut -d, -f1 | grep -E '^[0-9]' > date.csv
alldates="`cat date.csv`"
for date in $alldates
do
    mkdir $date
done
for date in $alldates
do
    echo "Stock,Open,High,Low,Close,Volume,Adjusted Close" > ./$date/djia_member_values.csv
done
for member in $allmembers
do
    for date in $alldates
    do
        grep -E "$date" $member.csv | awk -v var="$member" '$1=var' FS=, OFS=, >> ./$date/djia_member_values.csv
    done
done
for member in $allmembers
do
    rm $member.csv
done
rm date.csv
