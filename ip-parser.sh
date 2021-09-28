#!/bin/bash
ALL_IF=$(ifconfig -a | grep "flags\b" | awk '{print $1}'| sed 's/://g')
IPV4=$(ifconfig -a | grep "inet\b" | awk '{print $2}')
IP_perIF=$(ifconfig $IF | grep "inet\b" | awk '{print $2}')
echo $ALL_IF
echo $IPV4
