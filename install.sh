#!/bin/sh

echo "开始安装依赖"
yum install unzip wget curl lrzsz -y


echo "开始破解bt专业版..."

cd /www/server/panel/class
wget https://github.com/sppx/bt_crack/raw/master/bt_crack.zip
unzip -o bt_crack.zip
rm -f bt_crack.zip
wget -O update.sh http://download.bt.cn/install/update_pro.sh && bash update.sh pro
wget https://github.com/sppx/bt_crack/raw/master/bt.zip
unzip -o bt.zip
rm -f bt.zip
cd
sleep 3
/etc/init.d/bt restart
sleep 3
/etc/init.d/bt restart
