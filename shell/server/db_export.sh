#!/bin/bash

echo "DBパスワードを入力してください"
mysqldump -Q -h mysql716.db.sakura.ne.jp -u amaraimusi -p amaraimusi_sdrs --add-drop-table > www/sdrs/shell/sdrs.sql 2> www/sdrs/shell/dump.error.txt

echo "出力完了"