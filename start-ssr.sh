#!/bin/bash
# start ss-local
# log file was nohup.out
# First install shadowsocks-librev then use this script.

nohup ss-local -s v1.dedaa.com -p 8616 -l 1080 -k wf20190307 -m aes-256-cfb -b 127.0.0.1 &
