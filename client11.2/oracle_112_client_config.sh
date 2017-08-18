chmod 700 /root/awsdba/client11.2/oracle_112_get_oracle_repo.md /root/awsdba/client11.2/oracle_112_install_client.md
/root/awsdba/client11.2/oracle_112_get_oracle_repo.md
/root/awsdba/client11.2/oracle_112_install_client.md
/u01/app/oraInventory/orainstRoot.sh
cp /root/awsdba/client11.2/oracle_112_transfer_dump.pl /home/oracle/transfer_dump.pl
cp /root/awsdba/tnsnames.ora /u01/app/oracle/product/11.2/client_1/network/admin/tnsnames.ora
chown oracle:oinstall /u01/app/oracle/product/11.2/client_1/network/admin/tnsnames.ora /home/oracle/transfer_dump.pl
