#!/bin/bash

echo 'What is your name?'

read username

echo "Welcome ${username}! Please enter a password"

read -s password

echo "${password}"

