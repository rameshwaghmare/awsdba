cd /etc/yum.repos.d
wget http://public-yum.oracle.com/public-yum-ol6.repo
yum install -y lvm2 compat-libstdc++ binutils.x86_64 
yum install -y compat-libcap1.x86_64 gcc.x86_64 gcc-c++.x86_64 glibc.i686 glibc.x86_64 glibc-devel.i686 glibc-devel.x86_64 ksh 
yum install -y libaio.i686 libaio.x86_64 libaio-devel.i686 libaio-devel.x86_64 libgcc.i686 libgcc.x86_64 libstdc++.i686 
yum install -y libstdc++.x86_64 libstdc++-devel.i686 libstdc++-devel.x86_64 libXi.i686 libXi.x86_64 libXtst.i686 
yum install -y libXtst.x86_64 make.x86_64 sysstat.x86_64 cpp.x86_64 glibc-headers.x86_64 mpfr.x86_64 tigervnc-server 
yum install -y metacity xorg-x11-utils xterm dbus-x11 gnome-themes-standard firefox
yum install -y oracle-rdbms-server-11gR2-preinstall --nogpgcheck --disableexcludes=all
yum update -y
mkdir /u01 /oradata1 /dbarch
/sbin/mkfs -t ext4 /dev/xvdk
/sbin/mkfs -t ext4 /dev/xvdm
/sbin/mkfs -t ext4 /dev/xvdn
/bin/mount /dev/xvdk /u01
/bin/mount /dev/xvdm /oradata1
/bin/mount /dev/xvdn /dbarch
chown -R oracle:oinstall /u01 /oradata1 /dbarch
/sbin/mkswap /dev/xvdc
/sbin/swapon /dev/xvdc
{
   echo "/dev/xvdk /u01 ext4 defaults,nofail 0 2"
   echo "/dev/xvdm /oradata1 ext4 defaults,nofail 0 2" 
   echo "/dev/xvdn /dbarch ext4 defaults,nofail 0 2"
   echo "/dev/xvdc swap swap defaults 0 0" 
} >> /etc/fstab

{
    echo
    echo \#\#  Changes by Oracle Database Team,Rackspace
    echo "oracle        soft    nofile         131072"
    echo "oracle        hard    nofile         131072"
    echo "oracle        soft    nproc          131072"
    echo "oracle        hard    nproc          131072"
    echo "oracle        soft    core           unlimited"
    echo "oracle        hard    core           unlimited"
    echo "oracle        soft    memlock        134217728"
    echo "oracle        hard    memlock        134217728"
    echo "oracle        soft    stack          10240"
    echo \#\# End
    echo
 } >> /etc/security/limits.conf
 {
    echo
    echo "##  Changes by Oracle Database Team,Rackspace"
    echo  "if [ \$USER = \"oracle\" ] || [ \$USER = \"grid\" ]; then"
    echo  "      if [ \$SHELL = \"/bin/ksh\" ]; then"
    echo  "            ulimit -p 16384"
    echo  "            ulimit -u 16384"
    echo  "            ulimit -n 65536"
    echo  "      else"
    echo  "            ulimit -u 16384 -n 65536"
    echo  "      fi"
    echo  "      umask 022"
    echo  "fi"
    echo "## End"
    echo
 } >> /etc/profile
 {
    echo
    echo \#\#  Changes by Oracle Database Team,Rackspace
    echo "session    required     pam_limits.so"
    echo \#\# End
    echo
 } >> /etc/pam.d/login
