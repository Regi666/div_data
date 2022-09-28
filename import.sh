#!/bin/bash

host=http://localhost
port=8080

if [ "$#" -eq 2  ]; then
  host=$1
  port=$2

  echo "$1":"$2"

fi

curl -X POST -u hans:dmpf123 \
  -H "Content-Type: application/json" \
  "$host":"$port"/stocks \
  -d @stockList.json

curl -X POST -u hans:dmpf123 \
  -H "Content-Type: application/json"  \
  "$host":"$port"/paymentMonths   \
  -d @paymentMonths.json


declare -a dividendLists=("dividendList2018" "dividendList2019_20" "dividendList2021" "dividendList_comdirect" "dividendList_scalable")

for dividendList in "${dividendLists[@]}"
do

  curl -X POST -u hans:dmpf123 \
    -H "Content-Type: application/json"  \
    "$host":"$port"/dividends   \
    -d @"$dividendList".json

done

curl -X POST -u hans:dmpf123 \
  -H "Content-Type: application/json" \
  "$host":"$port"/portfolio   \
  -d @portfolioSnapshots.json
