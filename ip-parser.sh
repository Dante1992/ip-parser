#!/bin/bash

# "Filtering to show only ipv4, without loopbaack. replacing /mask with empty quotes, printing only colums with 'eth' and 'ip'"
DATA=$(ip -o addr show scope global |awk '{gsub(/\/.*/, " "); print $2" - "$4}')

# "If there is no arhument, just prin all interfaces with ip"
if [ "$#" -eq 0 ]; then
        echo $DATA
else
# "Declaring function to get positional parameters as argument"

        function IP_PER_IF () {
                for i in $*
                do
                  	# "Getting ip for each interface"
                        result=$(echo $DATA | grep "$i" | awk '{print $3}')

                        # "Checking if the result is IPV4 via REGEX"
                        if [[ $result =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
                                echo $result
                        else
                            	echo 'wrong interface name'
                        fi
                done
        }
	# "Calling function with $* as argument to check all"
        IP_PER_IF $*

fi

