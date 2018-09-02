#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

Backup='/etc/appnode/site/sitemgr.db.new';
DB='/opt/appnode/agent/apps/sitemgr/db/sitemgr.db';


function start(){
mkdir -p /etc/appnode/site/
cp  $DB $Backup
}


function recover_num(){
echo && stty erase '^H' && read -p "输入还原的编号或者备注: " num
mv $DB $DB\.$num\.$num
mv $DB\.$num $DB
mv $DB\.$num\.$num $DB\.$num
echo "已将 $num 还原 并备份现有数据为 $num"
}

function create_new(){
echo "即将备份现有数据"
echo && stty erase '^H' && read -p "输入要备份的编号或者备注: " num
mv $DB $DB\.$num
cp $Backup $DB

}

[[ $1 = "start" ]] && start
[[ $1 = "new" ]] && create_new
[[ $1 = "recover" ]] && recover_num