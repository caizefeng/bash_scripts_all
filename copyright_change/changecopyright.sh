#!/bin/bash
# File              : changecopyright.sh
# Author            : Zefeng Cai <czf17@mails.tsinghua.edu.cn>
# Date              : 05/30/2019
# Last Modified Date: 05/30/2019
# Last Modified By  : Zefeng Cai <czf17@mails.tsinghua.edu.cn>

for i in modules game
do
    for j in `find $i -type f`
    do
        sed -i '1,20d' $j
        cp new_copyright new_copyright_tmp
        cat $j >> new_copyright_tmp
        mv new_copyright_tmp $j
    done
done

echo Done!
