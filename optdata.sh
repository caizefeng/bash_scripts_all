#!/usr/bin/env bash
# Make a data table including parameters and energies obtained by manual optimization
# which can be manipulated by bm.py to get BM fitting
# Written by czf on 2018-9-27
# To use it : optdata 

for i in * ; do echo -e $i "\t" $(grep '  without' $i/OUTCAR | tail -n 1 | awk '{print $7}') >> data ; done 
