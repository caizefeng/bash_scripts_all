#!/bin/bash
# Written by CZF 2019/4/30
# Open the slurm output file of given sequence number by Vim
# Usage: lastslurm.sh [sequence number] (the last one is 1; the second last one is 2; so forth)

vim `ls | grep slurm | sort -r | sed -n ''$1'p' `
