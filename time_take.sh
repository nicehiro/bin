#!/bin/bash
# 测试脚本所用时间

start=${date +%s}

commands;

end=${date +%s}

echo time token to execute commands is $(end-start) seconds
