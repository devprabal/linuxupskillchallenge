#!/bin/bash
##TODO: run this script every time (I ssh && IP changed from previous)
## I think my ip also changes

usage() {
	echo "Usage: `basename $0` <ip_address>"
	exit 0
}

timestamp=$(date +%d-%b-%Y-%H-%M)
serverip="$1"
clientip=$(curl --silent ipinfo.io/ip)

if [[ -z "$severip" ]]; then
	usage
else
	if [[ -f "../aws/aws-ip" ]]; then
		echo "$timestamp" "$severip" "$clientip" >> aws-ip
	else
		echo 'create a file named aws-ip in the dir ( ../aws/ ) to this script'
	fi
fi

