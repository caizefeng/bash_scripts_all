#!/usr/bin/env bash
# Written by czf 2018-10-1
# To use it : source ent.sh job-ID (source must be added, or only begin an subprocess)

pwd_work=$(scontrol show job $1 | grep WorkDir | cut -c 12-)
cd $pwd_work
