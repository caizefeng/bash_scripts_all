#!/bin/bash
# File              : vacancy_f.sh
# Author            : Zefeng Cai <czf17@mails.tsinghua.edu.cn>
# Date              : 03/24/2020
# Last Modified Date: 03/24/2020
# Last Modified By  : Zefeng Cai <czf17@mails.tsinghua.edu.cn>

slurm_name=`ls | grep slurm | tail -1`
num_atom=`grep Created $slurm_name | grep atoms | awk '{print $2}'`
#echo $num_atom
defect_energy=`grep "Energy initial, next-to-last, final" -A 1 $slurm_name | tail -1 | awk '{print $3}'`
#echo $perfect_energy
perfect_energy=`grep "Energy initial, next-to-last, final" -A 1 $slurm_name | head -2 | tail -1 | awk '{print $3}'`
#echo $defect_energy
vacancy_energy=`echo "scale=4; $defect_energy - ($num_atom - 1) / $num_atom * $perfect_energy" | bc -l`
echo vacancy formation energy: $vacancy_energy eV
