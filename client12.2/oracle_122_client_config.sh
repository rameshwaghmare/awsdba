chmod 700 /root/awsdba/client12.2/oracle_122_get_oracle_repo.md /root/awsdba/client12.2/oracle_122_install_client.md
/root/awsdba/client12.2/oracle_122_get_oracle_repo.md
/root/awsdba/client12.2/oracle_122_install_client.md
/u01/app/oraInventory/orainstRoot.sh
cp /root/awsdba/client12.2/oracle_122_transfer_dump.pl /home/oracle/transfer_dump.pl
cp /root/awsdba/tnsnames.ora /u01/app/oracle/product/12.2/client_1/network/admin/tnsnames.ora
chown oracle:oinstall /u01/app/oracle/product/12.2/client_1/network/admin/tnsnames.ora /home/oracle/transfer_dump.pl
