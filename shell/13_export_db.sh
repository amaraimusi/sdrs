#!/bin/sh

echo '作業ディレクトリ'
pwd

echo "ローカルDBのパスワードを入力してください"
read pw

echo 'SQLをエクスポートします。'
mysqldump -uroot -p$pw sdrs > sdrs.sql
echo 'エクスポートしました。'

echo 'SQLファイルをサーバーに転送します。'
scp sdrs.sql amaraimusi@amaraimusi.sakura.ne.jp:www/sdrs/shell
echo '転送しました。'

echo "------------ 終わり"
cmd /k