#!/bin/sh
helpmenu() {
	case "$1" in 
	"compare")
		echo "./string.sh compare [str1] [str2]"
		;;
	"split")
		echo "./string.sh split [str] [delim]"
		;;
	*)
		echo "./string.sh [method] [args...]";
		;;
	esac
}

compare() {
	if [ $1 == $2 ]; then
		echo 1
	else
		echo 0
	fi
}

split() {
	echo "$1" | awk -F '$2' '{for( i=1;i<=NF; i++ ) print $i}'
}

case "$1" in
	--help | -h)
		helpmenu $2;
		exit;
		;;
	--compare | -c)
		if [ $# -eq 3 ]; then
			compare $2 $3
		else
			helpmenu "compare"
		fi
		;;
	--split | -s)
		if [ $# -lt 3 ]; then
			helpmenu "split"
		else
			split $2 $3
		fi
		;;
	*)
		helpmenu
		;;
esac
