#!/bin/bash

# capture interrupt # 2 (sigint)
trap '' 2

# read ctrl+c from keyboard with 30 second timeout

read -t 20 -p "I'm sleeping. Hit Ctrl+D to exit..."

