#!/bin/bash

#echo "Phase 1: Prepare source directory"
#mkdir -p openvas-src && cd openvas-src/
#
#echo "Phase 2: Dowload and extract all openvas components"
#wget http://wald.intevation.org/frs/download.php/1638/openvas-libraries-7.0.1.tar.gz
#wget http://wald.intevation.org/frs/download.php/1640/openvas-scanner-4.0.1.tar.gz
#wget http://wald.intevation.org/frs/download.php/1637/openvas-manager-5.0.0.tar.gz
#wget http://wald.intevation.org/frs/download.php/1639/greenbone-security-assistant-5.0.0.tar.gz
#wget http://wald.intevation.org/frs/download.php/1633/openvas-cli-1.3.0.tar.gz
#for i in $(ls); do tar zxvf $i; done
#rm *.tar.gz
#
#echo "Phase 3: Install packages to build openvas"
#apt-get install -y build-essential bison flex cmake pkg-config libglib2.0-0 libglib2.0-dev libgnutls28 libgnutls-dev libpcap0.8 libpcap0.8-dev libgpgme11 libgpgme11-dev doxygen libuuid1 uuid-dev sqlfairy sqlite3 xmltoman libxml2-dev libxslt1.1 libxslt1-dev xsltproc libmicrohttpd-dev
#
#echo "Phase 4: Build openvas libraries"
#BASEDIR=$(pwd)
#cd openvas-libraries-7.0.1
#mkdir source && cd source
#cmake ..
#make
#make install
#cd $BASEDIR
#
#echo "Phase 5: Build openvas components"
#for i in $(ls); do echo "$i installation"; cd $BASEDIR/$i; mkdir -p source && cd source; cmake .. && make && make install; echo "$i installation finished"; done
#
#echo "Phase 6: Setup and launch openvassd"
#openvas-mkcert
#ldconfig
#openvassd
#
#echo "Phase 7: Let's sync NVT plugins and the vulnerability data."
#openvas-nvt-sync --migrate-to-private
#openvas-scapdata-sync
#openvas-certdata-sync
#
#echo "Phase 8: Create a user account and client certificate."
#openvasmd --create-user=admin --role=Admin
#openvas-mkcert-client -n -i
#
#echo "Phase 9: Start everything"
#openvasmd --rebuild --progress
#openvasmd
#gsad
#
#echo "Installation finished"

apt-get install software-properties-common python-software-properties
add-apt-repository ppa:mrazavi/openvas
apt-get update
apt-get install sqlite3 openvas

openvas-nvt-sync
openvas-scapdata-sync
greenbone-scapdata-sync

wget --no-check-certificate https://svn.wald.intevation.org/svn/openvas/trunk/tools/openvas-check-setup
chmod +x openvas-check-setup
./openvas-check-setup --server