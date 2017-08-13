sudo -u oracle bash <<DOF
HOSTNAME=`hostname`
mkdir -p /u01/app/oracle/product/11.2/client_1
mkdir -p /u01/app/oraInventory
cd /u01
wget --http-user=$OBINUSER --http-password=$OBINPASS http://dfworacle1.racscan.com/Linux/x86-

64/11gR2/11.2.0.4.0/p13390677_112040_Linux-x86-64_4of7_Client.zip
unzip p13390677_112040_Linux-x86-64_4of7_Client.zip
/u01/client/runInstaller -ignoreSysPrereqs -ignorePrereq -waitforcompletion -showProgress -silent \
    -responseFile /u01/client/response/client_install.rsp \
    oracle.install.client.installType=Administrator \
    ORACLE_HOSTNAME=$HOSTNAME \
    UNIX_GROUP_NAME=oinstall \
    INVENTORY_LOCATION=/u01/app/oraInventory \
    SELECTED_LANGUAGES=en,en_GB \
    ORACLE_HOME=/u01/app/oracle/product/11.2/client_1 \
    ORACLE_BASE=/u01/app/oracle \
    SECURITY_UPDATES_VIA_MYORACLESUPPORT=false \
    DECLINE_SECURITY_UPDATES=true
echo "ORACLE_HOME=/u01/app/oracle/product/11.2/client_1;export ORACLE_HOME" >>/home/oracle/.bash_profile
echo "LD_LIBRARY_PATH=/u01/app/oracle/product/11.2/client_1/lib;export LD_LIBRARY_PATH" >>/home/oracle/.bash_profile
echo "PATH=/u01/app/oracle/product/11.2/client_1/bin:$PATH;export PATH" >>/home/oracle/.bash_profile
echo 'echo "###################################################################"' >>/home/oracle/.bash_profile
echo 'echo ORACLE_HOME=/u01/app/oracle/product/11.2/client_1/bin' >>/home/oracle/.bash_profile
echo 'echo "###################################################################"' >>/home/oracle/.bash_profile
