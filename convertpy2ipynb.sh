#! /bin/bash

for i in ch0{1..8}
do
    cd $i
    for j in $(ls | grep .py)
    do
        file_name=$j
        main_name=${file_name%".py"}  # clip the name before '.py'
        #echo $main_name.ipynb
        python ~/pythonscript/py2ipynb.py $j $main_name.ipynb
    done
    cd ..
done


     
