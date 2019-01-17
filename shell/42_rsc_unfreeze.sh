#!/bin/sh

echo 'サーバー先でsdrs_rsc.tar.gzを解凍します。'
ssh -l amaraimusi amaraimusi.sakura.ne.jp "
	cd www/sdrs/app/webroot;
	pwd;
	tar vxzf sdrs_rsc.tar.gz;
	exit;
	"

echo "------------ 解凍完了"
cmd /k