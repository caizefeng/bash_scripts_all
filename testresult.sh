#!/bin/bash	

rm -rf result
cat INCAR >> result
echo ------------------------------------------------------------------------------------------ >> result
echo -e AMIX '\t' Energy\(eV\) '\t' '\t' Steps '\t' '\t' Time\(sec\)  '\t'    Magnetization >> result
echo ------------------------------------------------------------------------------------------ >> result
for i in {1..20}
do 
	enr_line=`echo "2+($i-1)*3" |bc `
	stp_line=`echo "1+($i-1)*3" |bc `
	tim_line=`echo "3+($i-1)*3" |bc `
	
	amix=`echo "$i*0.01" | bc`
	enr=`grep -C 1 mag slurm* | sed '/--/d' | sed -n ''$enr_line'p' | awk '{print$5}'`
	stp=`grep -C 1 mag slurm* | sed '/--/d' | sed -n ''$stp_line'p' | awk '{print$2}'`
	tim=`grep -C 1 mag slurm* | sed '/--/d' | sed -n ''$tim_line'p' | awk '{print$4}'`
	mag=`grep -C 1 mag slurm* | sed '/--/d' | sed -n ''$enr_line'p' | awk '{print$10,$11,$12}'`
	echo -e $amix '\t' $enr '\t' $stp '\t' '\t' $tim '\t' $mag >> result
done 		
