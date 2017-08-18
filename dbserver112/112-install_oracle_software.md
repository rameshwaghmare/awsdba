sudo -u oracle bash <<DOF
HOSTNAME=`hostname`
mkdir -p /u01/app/oracle/product/11.2.0/dbhome_1
mkdir -p /u01/app/oraInventory
cd /u01
wget --http-user=$OBINUSER --http-password=$OBINPASS http://dfworacle1.racscan.com/Linux/x86-64/11gR2/11.2.0.4.0/p13390677_112040_Linux-x86-64_1of7_database_1.zip
wget --http-user=$OBINUSER --http-password=$OBINPASS http://dfworacle1.racscan.com/Linux/x86-64/11gR2/11.2.0.4.0/p13390677_112040_Linux-x86-64_2of7_database_2.zip
wget --http-user=$OBINUSER --http-password=$OBINPASS http://dfworacle1.racscan.com/Linux/x86-64/11gR2/11.2.0.4.0/PSU/p6880880_112000_Linux-x86-64.zip
wget --http-user=$OBINUSER --http-password=$OBINPASS http://dfworacle1.racscan.com/Linux/x86-64/11gR2/11.2.0.4.0/PSU/p19121551_112040_Linux-x86-64_Oct2014_Database_PSU.zip
unzip p13390677_112040_Linux-x86-64_1of7_database_1.zip
unzip p13390677_112040_Linux-x86-64_2of7_database_2.zip
unzip p19121551_112040_Linux-x86-64_Oct2014_Database_PSU.zip
/u01/database/runInstaller -ignoreSysPrereqs -ignorePrereq -waitforcompletion -showProgress -silent \
   -responseFile /u01/database/response/db_install.rsp \
    oracle.install.option=INSTALL_DB_SWONLY \
    ORACLE_HOSTNAME=$HOSTNAME \
    UNIX_GROUP_NAME=oinstall \
    INVENTORY_LOCATION=/u01/app/oraInventory \
    SELECTED_LANGUAGES=en,en_GB \
    ORACLE_HOME=/u01/app/oracle/product/11.2.0/dbhome_1 \
    ORACLE_BASE=/u01/app/oracle \
    oracle.install.db.InstallEdition=$DBEDITION \
    oracle.install.db.DBA_GROUP=oinstall \
    oracle.install.db.BACKUPDBA_GROUP=oinstall \
    oracle.install.db.DGDBA_GROUP=oinstall \
    oracle.install.db.KMDBA_GROUP=oinstall \
    SECURITY_UPDATES_VIA_MYORACLESUPPORT=false \
    DECLINE_SECURITY_UPDATES=true
DOF
