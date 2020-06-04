#!/bin/bash
# File              : cp2gpu.sh
# Author            : Zefeng Cai <czf17@mails.tsinghua.edu.cn>
# Date              : 09/13/2019
# Last Modified Date: 09/13/2019
# Last Modified By  : Zefeng Cai <czf17@mails.tsinghua.edu.cn>
# Description       : scp files to lzhpc@166.111.38.98
# Usage             : cp2gpu A(path in cavatina) B(path in gpu server)

tranfered_file=$1
target=$2

scp -r $1 lzhpc@166.111.38.90:$2
