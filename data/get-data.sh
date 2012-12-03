#!/bin/bash

get-population-data() {
  year=$1
  url=$2
  fieldwidths=$3

  if [ ! -e $(basename $url) ]; then
    curl -O $url
  fi

  cat $(basename $url) \
    | gawk '!/^ *$/' \
    | gawk '/New York/,/---/' \
    | grep -v '^\-' \
    | gawk -v FIELDWIDTHS="$fieldwidths" -v OFS=',' '{ gsub(/,.+/,"",$2); gsub(/ city/,"",$2); gsub(/^ +/,"",$2); gsub(/,/,"",$3); gsub(/ +/,"",$3); print $2, $3 }' \
    > $year.tmp

  cat <(echo 'name,value') $year.tmp > $year.csv

  rm $year.tmp
}

get-population-data-2() {
  year=$1
  url=$2
  fieldwidths=$3

  if [ ! -e $(basename $url) ]; then
    curl -O $url
  fi

  cat $(basename $url) \
    | gawk '!/^ *$/' \
    | gawk '/New York/,/Athens-Clarke/' \
    | gawk -v FIELDWIDTHS="$fieldwidths" -v OFS=',' '{ gsub(/,.+/,"",$1); gsub(/ city/,"",$1); gsub(/^ +/,"",$1); gsub(/,/,"",$2); gsub(/ +/,"",$2); print $1, $2 }' \
    > $year.tmp

  cat <(echo 'name,value') $year.tmp > $year.csv

  rm $year.tmp
}

get-population-data 1790 http://www.census.gov/population/www/documentation/twps0027/tab02.txt '9 41 11'
get-population-data 1800 http://www.census.gov/population/www/documentation/twps0027/tab03.txt '9 41 11'
get-population-data 1810 http://www.census.gov/population/www/documentation/twps0027/tab04.txt '9 41 11'
get-population-data 1820 http://www.census.gov/population/www/documentation/twps0027/tab05.txt '7 37 11'
get-population-data 1830 http://www.census.gov/population/www/documentation/twps0027/tab06.txt '7 37 11'
get-population-data 1840 http://www.census.gov/population/www/documentation/twps0027/tab07.txt '7 37 11'
get-population-data 1850 http://www.census.gov/population/www/documentation/twps0027/tab08.txt '7 37 11'
get-population-data 1860 http://www.census.gov/population/www/documentation/twps0027/tab09.txt '7 37 11'
get-population-data 1870 http://www.census.gov/population/www/documentation/twps0027/tab10.txt '7 37 11'
get-population-data 1880 http://www.census.gov/population/www/documentation/twps0027/tab11.txt '7 37 11'
get-population-data 1890 http://www.census.gov/population/www/documentation/twps0027/tab12.txt '7 37 11'
get-population-data 1900 http://www.census.gov/population/www/documentation/twps0027/tab13.txt '7 37 11'
get-population-data 1910 http://www.census.gov/population/www/documentation/twps0027/tab14.txt '7 26 11'
get-population-data 1920 http://www.census.gov/population/www/documentation/twps0027/tab15.txt '7 27 11'
get-population-data 1930 http://www.census.gov/population/www/documentation/twps0027/tab16.txt '7 27 11'
get-population-data 1940 http://www.census.gov/population/www/documentation/twps0027/tab17.txt '7 27 11'
get-population-data 1950 http://www.census.gov/population/www/documentation/twps0027/tab18.txt '7 27 11'
get-population-data 1960 http://www.census.gov/population/www/documentation/twps0027/tab19.txt '7 27 11'
get-population-data 1970 http://www.census.gov/population/www/documentation/twps0027/tab20.txt '7 27 11'
get-population-data 1980 http://www.census.gov/population/www/documentation/twps0027/tab21.txt '7 27 11'
get-population-data 1990 http://www.census.gov/population/www/documentation/twps0027/tab22.txt '7 27 11'
get-population-data-2 2000 http://www.census.gov/statab/ccdb/cit1020r.txt '45 10'
# TODO 2010