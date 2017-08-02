#!/bin/bash

netcatCommand(){
	RESULT="";
	nc -z -w 1 $1 $2
	RESULT=$(echo $?)
}

check(){
	netcatCommand $HOST $PORT
	if [[ $RESULT == 0 ]]; then
		echo "Server is UP"
	else
		echo "Server is DOWN"
	fi
}

helpMsg(){
	echo ""
	echo "Usage:"
	echo "  netcat.sh -H[destination] -L[port]"
	echo ""
	echo "		-H : destination host that will check"
	echo "		-L : destination host port"
	exit 3;
}

if [[ "$#" -lt 2 ]]; then
	echo "Required args is missing";
	helpMsg
	exit 1;
fi

while getopts 'H:L:F' OPT; do
   case $OPT in
      H) HOST=$OPTARG;;
      L) PORT=$OPTARG;;
			F) helpMsg;;
      *) exit 1;;
   esac
done

check
