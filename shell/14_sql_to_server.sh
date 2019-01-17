#!/bin/sh
echo 'sqlファイルをサーバーに送信します。'

scp sdrs.sql amaraimusi@amaraimusi.sakura.ne.jp:www/sdrs/shell
echo "------------ 送信完了"
cmd /k