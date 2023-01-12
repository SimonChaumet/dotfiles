#!/bin/sh

vpn=$(nmcli connection show -a | grep 'vpn' | awk '{print $1}')

if [ "$vpn" != "\
" ]; then
	echo $vpn
else
	echo ""
fi
