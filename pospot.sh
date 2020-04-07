#!/usr/bin/env bash  
# show old POTCAR 
if [ -e POTCAR ]; then 
  echo 'old POTCAR containes....'
  grep TIT POTCAR| awk '{print $4}' | xargs
# Remove old POTCAR  
  echo '************************'
  echo "Removing OLD POTCAR....."
  echo '************************'
  rm POTCAR -f 
fi

# generate new POTCAR 
echo "Generating NEW POTCAR..."
echo '************************'
potcar.sh $(sed -n 6p POSCAR)
echo "Done"

# compare elements in new POTCAR and POSCAR
echo '************************'
echo 'NEW POTCAR containes....'
grep TIT POTCAR| awk '{print $4}' | xargs
echo '************************'
echo "Elements in POSCAR" 
echo '************************'
sed -n 6p POSCAR
