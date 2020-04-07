#! /usr/bin/env bash

# To generate general KPOINTS file
# Written by czf on 2018-09-26
# Example to use it: kpoints.sh 3 3 1


echo K-POINTS > KPOINTS           # First Line
echo 0 >> KPOINTS                 # Auto Generate Scheme
echo Gamma-Centered >> KPOINTS    # Gamma-centered MP grids
echo $1 $2 $3 >> KPOINTS          # subdivisions for N1, N2 and N3
echo 0 0 0 >> KPOINTS             # optional shift of the mesh
