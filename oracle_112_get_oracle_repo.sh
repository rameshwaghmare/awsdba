cd /etc/yum.repos.d
yum update -y
yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
yum install unzip wget libaio.x86_64 compat-libstdc++-33.x86_64 -y
wget http://public-yum.oracle.com/public-yum-ol6.repo
yum install -y oracle-rdbms-server-11gR2-preinstall --nogpgcheck
mkdir /u01 /exportdump
mkfs -t ext4 /dev/xvdk
mkfs -t ext4 /dev/xvdm
mount /dev/xvdk /u01
mount /dev/xvdm /exportdump
chown -R oracle:oinstall /u01 /exportdump
mkswap /dev/xvdc
swapon /dev/xvdc
echo "/dev/xvdk /u01 ext4 defaults,nofail 0 2" >> /etc/fstab
echo "/dev/xvdm /exportdump ext4 defaults,nofail 0 2" >> /etc/fstab
echo "/dev/xvdc swap swap defaults 0 0" >> /etc/fstab
echo "tmpfs /tmp tmpfs size=4G 0 0" >> /etc/fstab
mount -a
chmod 744 /root/awsdba/tnsnames.ora
