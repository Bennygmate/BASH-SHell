#!/bin/sh
#Grab data from UNSW website handbook then takes course code then code name and prints them out
#set -x

if test $# = 0
then
    echo "Usage $0: <files>" 1>@2
    exit 1 
fi

if test $# -ne 1
then 
    echo "Usage $0: <files>" 2>/dev/null
    exit 1
fi

codeName=$1
i=$codeName

while true
do
    `echo $i > tmp.txt`
    tmp=`cut -c1 < tmp.txt`
    #echo "$tmp"
    #echo "$codeName"
    rm -r tmp.txt
    wget -q -O- "http://www.handbook.unsw.edu.au/vbook2016/brCoursesByAtoZ.jsp? StudyLevel=Undergraduate&descr=$tmp" | grep "$codeName" | cut -f9 | egrep handbook | cut -d '/' -f7-8 > tmp1.txt
    wget -q -O- "http://www.handbook.unsw.edu.au/vbook2016/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=$tmp" |grep "$codeName" | cut -f9 | egrep handbook | cut -d '/' -f7-8 > tmp2.txt
    cat tmp1.txt tmp2.txt > tmp3.txt
    cut -c1-8 tmp3.txt | tr -d '/$' > code.txt
    cut -d '>' -f2 tmp3.txt | tr -d '<' | sed 's/\/A$//' | sed 's/ $//' > course.txt
    paste -d ' ' code.txt course.txt > all.txt
    sort -n all.txt | uniq 
    rm -f tmp1.txt tmp2.txt tmp3.txt code.txt course.txt all.txt
     
    exit 0
done





