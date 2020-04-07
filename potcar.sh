#!/usr/bin/env bash
# Create a PBE_PAW POTCAR file by concatenation of POTCAR.Z files
# Written by czf on 2018-9-26
# To use it: potcar.sh Ba_sv Ti_sv O or Cu C H O 

# Define local paw_pbe pot repository
repo="/opt/soft/vasp/5.3.2/vasppot/paw_pbe"

#Check if previous POTCAR exists 
if [ -f POTCAR ] ; then
 mv -f POTCAR old-POTCAR
 echo " ** Warning: previous POTCAR file found and renamed to 'old-POTCAR'."
fi

# Main loop concatenate appropriate POTCARs
for i in $*
do
 if test -f $repo/$i/POTCAR.Z ; then
  zcat $repo/$i/POTCAR.Z >> POTCAR
 elif test -f $repo/$i/POTCAR ; then
  cat $repo/$i/POTCAR >> POTCAR
 elif test -f $repo/$i/POTCAR.gz ; then
  gunzip -c $repo/$i/POTCAR.gz >> POTCAR
 else
  echo " ** Warning: No suitable POTCAR for element '$i' found!! Skipped this element."
 fi
done
 
