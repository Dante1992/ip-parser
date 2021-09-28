#!/bin/bash
ip -o addr show scope global | awk '{gsub(/\/.*/, " "); print $2" - "$4}'

