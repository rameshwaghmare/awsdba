chmod 700 /root/awsdba/dbserver112/112-set_fs_oracle_repo.md 
chmod 700 /root/awsdba/dbserver112/112-install_oracle_software.md 
sleep 60
/u01/app/oraInventory/orainstRoot.sh 
/u01/app/oracle/product/11.2.0/dbhome_1/root.sh 
chmod 700 /root/awsdba/dbserver112/112-install_opatch.md 
chmod 700 /root/awsdba/dbserver112/112-create_oracle_db.md 
/root/awsdba/dbserver112/112-set_fs_oracle_repo.md 
/root/awsdba/dbserver112/112-install_oracle_software.md 
/root/awsdba/ocm.rsp /home/oracle/ocm.rsp
chmod 700 /home/oracle/ocm.rsp
chown oracle:oinstall /home/oracle/ocm.rsp
/root/awsdba/dbserver112/112-install_opatch.md 
/root/awsdba/dbserver112/112-create_oracle_db.md
