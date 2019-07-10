#!/bin/bash

# captures an interrupt with the end specifying the number
trap 'echo "Exit 0 signal detected..."' 0

# normal body of script
echo "This is a test"

#exit script and specify signal
exit 0
