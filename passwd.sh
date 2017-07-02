#!/bin/bash
# input password without show

echo -e "enter password:"
# cannot show message
stty -echo
read password
# can show message
stty echo
echo
echo Password read
