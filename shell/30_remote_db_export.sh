#!/bin/sh

echo 'サーバー側のシェルを実行します。'
ssh -l amaraimusi amaraimusi.sakura.ne.jp "
	sh www/sdrs/shell/server/db_export.sh;
	"

echo "サーバー側のシェルをすべて実行しました。"
cmd /k