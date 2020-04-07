#!/bin/bash
# File              : exkpoints.sh
# Author            : Zefeng Cai <czf17@mails.tsinghua.edu.cn>
# Date              : 03/14/2020
# Last Modified Date: 03/14/2020
# Last Modified By  : Zefeng Cai <czf17@mails.tsinghua.edu.cn>
# Description       : The script to extract the coordinates of kpoints in reciprocal space

#num_x=`head -n 4 KPOINTS | tail -n 1 | awk '{print $1}'`
#num_y=`head -n 4 KPOINTS | tail -n 1 | awk '{print $2}'`
#num_z=`head -n 4 KPOINTS | tail -n 1 | awk '{print $3}'`
#kpoint_num=`echo "$num_x * $num_y * $num_z" | bc -l`

#grep -A $kpoint_num "k-points in reciprocal lattice and weights" OUTCAR  >> KPOINTS_COOR

line_1=`grep -n "Following reciprocal coordinates" OUTCAR | awk -F ":" '{print$1}'`
line_2=`grep -n "Following cartesian coordinates:" OUTCAR | awk -F ":" '{print$1}'`
#echo $line_1 
line_begin=`echo "$line_1 + 1" | bc -l`
line_end=`echo "$line_2 - 2" | bc -l`

sed -n "${line_begin},${line_end}p" OUTCAR

