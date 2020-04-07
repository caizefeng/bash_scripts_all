#!/bin/bash
# File              : nparchg.sh
# Author            : Zefeng Cai <czf17@mails.tsinghua.edu.cn>
# Date              : 09/04/2019
# Last Modified Date: 09/04/2019
# Last Modified By  : Zefeng Cai <czf17@mails.tsinghua.edu.cn>
# Description : Get the number of partial charge calculation done. 

lastslurm_file=`ls | grep slurm | sort -r | sed -n '1p'`
grep 'Finished calculating partial charge density.' $lastslurm_file | wc -l
