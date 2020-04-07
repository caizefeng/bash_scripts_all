#!/bin/bash
# File              : cleanpts.sh
# Author            : Zefeng Cai <czf17@mails.tsinghua.edu.cn>
# Date              : 03/01/2020
# Last Modified Date: 03/01/2020
# Last Modified By  : Zefeng Cai <czf17@mails.tsinghua.edu.cn>

# kill all pseudo terminals except the current one 
hostname=`whoami`
all_pts=`who | grep $hostname | awk '{print $2}'`
current_pts_wd=`tty`
current_pts=${current_pts_wd:5}

for i in $all_pts
do
    if [ $i != $current_pts ]
    then
        pkill -kill -t $i
    fi
done

