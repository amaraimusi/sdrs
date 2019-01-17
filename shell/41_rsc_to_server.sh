#!/bin/sh
echo 'sqlファイルをサーバーに送信します。'

cd ../app/webroot
echo '作業ディレクトリ'
pwd
scp sdrs_rsc.tar.gz amaraimusi@amaraimusi.sakura.ne.jp:www/sdrs/app/webroot
echo "sdrs_rsc.tar.gzの送信完了"


cmd /k