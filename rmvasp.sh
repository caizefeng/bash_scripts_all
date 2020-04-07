#!/usr/bin/env bash
# To use it : rmvasp.sh (in the parent directory)


for i in $(find . -name INCAR) ; do
  cd $(dirname $i)
  rm CHG CHGCAR PCDAT WAVECAR XDATCAR OSZICAR DOSCAR EIGENVAL IBZKPT CONTCAR OUTCAR vasprun.xml -f 
  cd $OLDPWD ; 
done
