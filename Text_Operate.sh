#!/bin/bash

#访问来源主机TOP 100和分别对应出现的总次数
function HOST_TOP_100() {
	echo "访问来源主机TOP 100和分别对应出现的总次数"
	awk -F '\t' '{a[$1]++} END {for( i in a){print i ,a[i] |"sort -nr -k 2 -o 1.txt"}}' web_log.tsv
	cat 1.txt | head -n 100
}

#访问来源主机TOP 100 IP和分别对应出现的总次数
function IP_TOP_100(){
	echo "访问来源主机TOP 100 IP和分别对应出现的总次数"
	egrep '^[[:digit:]]{1,3}\.' web_log.tsv >2.txt
	awk -F '\t' '{a[$1]++} END {for( i in a){print i ,a[i] |"sort -nr -k 2 -o 3.txt"}}' 2.txt
	cat 3.txt | head -n 100
}

#最频繁被访问的URL
function TOP_URL(){
	echo "最频繁被访问的URL"
	awk -F '\t' '{a[$5]++} END {for( i in a){print i, a[i]  |"sort -nr -k 2 -o 4.txt"}}' web_log.tsv
	cat 4.txt | head -n 100
}


#不同响应状态码的出现次数和对应百分比
function RESPONSE_TIME_RATE(){
	awk -F '\t' '{a[$6]++} END {for( i in a){print i, a[i] |"sort -nr -k 2 -o 5.txt"}}' web_log.tsv
	file=$(awk -F '\t' '{print $2}' 5.txt)
	for ff in $file ;
	do
		sum=$[$sum+1]
	done
	file=$(awk -F '\t' '{print $2}' 5.txt)
	aa=""
	echo "不同响应状态码的出现次数和对应百分比"
	for fin in $file;
	do
		all=$[$all+1]
		aa=$(awk -F '\t' 'NR=='$all'' '{print$1}' 5.txt)
		echo "$aa\t$fin"
		awk 'BEGIN{printf "%.2f\n",'$fin'/'$sum'}'
	done
	cat 5.txt
}

#统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
function URL_4XX_TIME(){
	echo "统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数"
	cat web_log.tsv |awk -F '\t' '{print $6,$5}' | grep '403 ' | sort|uniq -c |sort -k 1 -nr|head -n 10
	echo "\n"
	cat web_log.tsv |awk -F '\t' '{print $6,$5}' | grep '404 ' | sort|uniq -c |sort -k 1 -nr|head -n 10
}

#给定URL输出TOP 100访问来源主机
function URL_TOP_100(){
	echo "给定URL输出TOP 100访问来源主机"
	url=$2
	grep "$url" |awk -F '\t' '{print $1}' web_log.tsv |sort|uniq -c |sort -nr|head -n 10
}

#帮助文档
function Help(){
	echo "如何使用："
	echo " -a    统计访问来源主机TOP 100和分别对应出现的总次数"
	echo " -b    统计访问来源主机TOP 100 IP和分别对应出现的总次数"
	echo " -c    统计最频繁被访问的URL TOP 100"
	echo " -d    统计不同响应状态码的出现次数和对应百分比"
	echo " -e    分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数"
	echo " -f URL    给定URL输出TOP 100访问来源主机"
}


# main()
sum=0
all=0
if [[ $1 == "-a" ]];then
	HOST_TOP_100
        fi

if [[ $1 == "-b" ]];then
	IP_TOP_100
        fi

if [[ $1 == "-c" ]];then
	TOP_URL
	fi

if [[ $1 == "-d" ]];then
	RESPONSE_TIME_RATE
	fi

if [[ $1 == "-e" ]];then
	URL_4XX_TIME
        fi

if [[ $1 == "-f" ]];then
	URL_TOP_100
	fi

if [[ $1 == "-h" ]];then
	Help
	fi
