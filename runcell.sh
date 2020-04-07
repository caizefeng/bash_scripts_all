#!/bin/bash
BIN=~/Programs/VASP/bin
rm WAVECAR
for i in 5.30 5.466 5.468 5.470 5.472 5.474 5.476 5.478 5.480
do
cat > POSCAR << !
Si
$i
0.5   0.5   0.0
0.0   0.5   0.5
0.5   0.0   0.5
2
Cartesian
0     0     0
0.25  0.25  0.25
!
echo "a= $i" 
$BIN/vasp
E=`tail -1 OSZICAR` ; echo $i $E >> SUMMARY.fcc
done
cat SUMMARY.fcc
