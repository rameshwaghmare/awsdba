sudo -u oracle bash <<FOF
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/dbhome_1
export ORACLE_SID=$DBNAME
export ORACLE_BASE=/u01/app/oracle
/u01/app/oracle/product/11.2.0/dbhome_1/bin/netca -silent -responsefile /u01/app/oracle/product/11.2.0/dbhome_1/assistants/netca/netca.rsp
/u01/app/oracle/product/11.2.0/dbhome_1/bin/dbca -silent \
     -createDatabase \
     -templateName General_Purpose.dbc \
     -gdbname $DBNAME \
     -sid $DBNAME \
     -responseFile NO_VALUE \
     -characterSet $DBCHAR \
     -memoryPercentage 60 \
     -emConfiguration $DBEM \
        -dbsnmpPassword $DBPASS \
        -sysmanPassword $DBPASS \
     -redoLogFileSize 512 \
     -recoveryAreaDestination /dbarch \
     -syspassword $DBPASS \
     -systempassword $DBPASS \
     -sampleSchema false \
     -databaseType MULTIPURPOSE \
     -storageType FS \
     -datafileDestination /oradata1    
{
  echo
  echo "##  Changes by Oracle Database Team, Rackspace"
  echo "export ORACLE_SID=$DBNAME"
  echo "export ORACLE_HOME=/u01/app/oracle/product/11.2.0/dbhome_1"
  echo "export ORACLE_BASE=/u01/app/oracle"
  echo ""
  echo "## Change below only, if you know what your doing"
  echo ""
  echo "export EDITOR=vi"
  echo "PATH=\$ORACLE_HOME/bin:\$PATH:/usr/local/bin"
  echo "export LD_LIBRARY_PATH=\$ORACLE_HOME/lib"
  echo "ORACLE_UNQNAME=\$ORACLE_SID"
  echo "export ORACLE_UNQNAME"
  echo "alias cdo='cd \$ORACLE_HOME'"
  echo "alias cdb='cd \$ORACLE_BASE'"
  echo "alias bdump='cd \$ORACLE_BASE/diag/rdbms/\$ORACLE_SID/\$ORACLE_SID/trace'"
  echo "alias udump='cd \$ORACLE_BASE/diag/rdbms/\$ORACLE_SID/\$ORACLE_SID/trace'"
  echo "alias alert='tail -f -n100 \$ORACLE_BASE/diag/rdbms/\$ORACLE_SID/\$ORACLE_SID/trace/alert_\$ORACLE_SID.log'"
  echo "## End"
  echo
} >> /home/oracle/.bash_profile
FOF
