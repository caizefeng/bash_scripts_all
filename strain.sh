#! /bin/bash

for i in 0.002 0.004 0.006 0.008 0.01 0.02 0.03 0.04 0.05
do
	mkdir $i 
	cp INCAR POTCAR KPOINTS OPTCELL submit $i 
	cd $i
	var=`echo "scale=4; 2.8333698628588571 * ($i + 1)"| bc`
cat > POSCAR <<!
Fe                                      
   1.00000000000000     
     $var    0.0000000000000000    0.0000000000000000
     0.0000000000000000    2.8333698628588571    0.0000000000000000
     0.0000000000000000    0.0000000000000000    2.8333698628588571
   Fe
     2
Direct
 -0.0000000000000000  0.0000000000000000 -0.0000000000000000
  0.5000000000000000  0.5000000000000000  0.5000000000000000
 
  0.00000000E+00  0.00000000E+00  0.00000000E+00
  0.00000000E+00  0.00000000E+00  0.00000000E+00
!
	cd $OLDPWD
done
