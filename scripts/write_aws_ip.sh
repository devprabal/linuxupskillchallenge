#!/bin/bash
usage() {
	echo "Usage: `basename $0` <ip_address>"
	exit 0
}

timestamp=$(date +%d-%b-%Y-%H-%M)
if [[ -z "$1" ]]; then
	usage
else
	if [[ -f "../aws-ip" ]]; then
		echo "$timestamp" "$1" >> aws-ip
	else
		echo 'create a file named aws-ip in the parent dir ( ../ ) to this script'
	fi
fi

