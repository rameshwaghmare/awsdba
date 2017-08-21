sudo -u oracle bash <<BOF
mv /u01/p6880880_121010_Linux-x86-64.zip /u01/app/oracle/product/12.1.0/dbhome_1/.
cd /u01/app/oracle/product/12.1.0/dbhome_1
unzip -o p6880880_121010_Linux-x86-64.zip
cd /u01 
{ 
	export ORACLE_HOME=/u01/app/oracle/product/12.1.0/dbhome_1 
        export LD_LIBRARY_PATH=/u01/app/oracle/product/12.1.0/dbhome_1/lib 
        export PATH=/u01/app/oracle/product/11.2.0/dbhome_1/bin:/u01/app/oracle/product/12.1.0/dbhome_1/OPatch:$PATH 
        cd /u01/19954978
        /u01/app/oracle/product/11.2.0/dbhome_1/OPatch/opatch apply -silent
}
BOF
