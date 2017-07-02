#!/bin/bash
# prepend
# 在 bash 中扩展环境变量

# -d 如果第二个参数存在返回 1
# 
prepend() {
	[ -d "$2" ] && eval $1=\"$2':'\$$1\" && export $1;
}

prepend PATH /home/hiro/bin/
