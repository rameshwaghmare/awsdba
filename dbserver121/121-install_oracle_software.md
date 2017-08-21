sudo -u oracle bash <<DOF
HOSTNAME=`hostname`
mkdir -p /u01/app/oracle/product/12.1.0/dbhome_1
mkdir -p /u01/app/oraInventory
cd /u01
wget --http-user=$OBINUSER --http-password=$OBINPASS http://dfworacle1.racscan.com/Linux/x86-64/12cR1/12.1.0.2.0/linuxamd64_12102_database_1of2.zip
wget --http-user=$OBINUSER --http-password=$OBINPASS http://dfworacle1.racscan.com/Linux/x86-64/12cR1/12.1.0.2.0/linuxamd64_12102_database_2of2.zip
wget --http-user=$OBINUSER --http-password=$OBINPASS http://dfworacle1.racscan.com/Linux/x86-64/12cR1/12.1.0.2.0/p6880880_121010_Linux-x86-64.zip
wget --http-user=$OBINUSER --http-password=$OBINPASS http://dfworacle1.racscan.com/Linux/x86-64/12cR1/12.1.0.2.0/p19954978_121020_Linux-x86-64_JAN2015_PSU.zip
unzip linuxamd64_12102_database_1of2.zip
unzip linuxamd64_12102_database_2of2.zip
unzip p19954978_121020_Linux-x86-64_JAN2015_PSU.zip
unzip p6880880_121010_Linux-x86-64.zip
/u01/database/runInstaller -ignoreSysPrereqs -ignorePrereq -waitforcompletion -showProgress -silent \
    -responseFile /u01/database/response/db_install.rsp \
    oracle.install.option=INSTALL_DB_SWONLY \
    ORACLE_HOSTNAME=$HOSTNAME \
    UNIX_GROUP_NAME=oinstall \
    INVENTORY_LOCATION=/u01/app/oraInventory \
    SELECTED_LANGUAGES=en,en_GB \
    ORACLE_HOME=/u01/app/oracle/product/12.1.0/dbhome_1 \
    ORACLE_BASE=/u01/app/oracle \
    oracle.install.db.InstallEdition=$DBEDITION \
    oracle.install.db.DBA_GROUP=oinstall \
    oracle.install.db.BACKUPDBA_GROUP=oinstall \
    oracle.install.db.DGDBA_GROUP=oinstall \
    oracle.install.db.KMDBA_GROUP=oinstall \
    SECURITY_UPDATES_VIA_MYORACLESUPPORT=false \
    DECLINE_SECURITY_UPDATES=true
DOF
