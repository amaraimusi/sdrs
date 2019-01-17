#!/bin/sh

cd ../../
echo '作業ディレクトリ'
pwd
echo 'sdrsを圧縮開始'
tar cvzf sdrs.tar.gz sdrs
echo 'sdrs.tar.gzを作成'
echo "------------ 終わり"
cmd /k