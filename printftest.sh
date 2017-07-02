#!/bin/bash
# printf
# %s %c %d %f 字符 浮点数
# - 左对齐 默认右对齐
# .2f 小数点后两位
# \n 默认不换行

printf "%-5s %-10s %-4s\n" No Name Mark
printf "%-5s %-10s %-4.2f\n" 1 Sarath 80.3456
printf "%-5s %-10s %-4.2f\n" 2 James 90.8943
printf "%-5s %-10s %-4.2f\n" 3 Hiro 18.8934

# 打印彩色输出
# 背景：（文字颜色要减10）
# 重置：0
# 黑色：40
# 红色：41
# 绿色：42
# 黄色：43
# 白色：47
# 等等

echo -e "\e[1;31m This is red Text \e[0m"
