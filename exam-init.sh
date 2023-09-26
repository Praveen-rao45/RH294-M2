#/bin/bash

dnf install httpd -y     > /dev/null 2>&1
systemctl enable --now  httpd   > /dev/null 2>&1

echo -ne '#####                      (33%)\r'

cp -rf Rhce  /var/www/html/Rhce     > /dev/null 2>&1
systemctl  restart httpd   > /dev/null 2>&1
wget -P /root/RH294-M2 http://localhost/Rhce/mock2/inventory    > /dev/null 2>&1
wget -P /root/RH294-M2 http://localhost/Rhce/mock2/ansible.cfg  > /dev/null 2>&1
mkdir /root/RH294-M2/collections
ansible-galaxy collection install  http://localhost/Rhce/ansible-posix-1.4.0.tar.gz -p /root/RH294-M2/collections  > /dev/null 2>&1
ansible-galaxy collection install  http://localhost/Rhce/redhat-rhel_system_roles-1.0.0.tar.gz -p /root/RH294-M2/collections  > /dev/null 2>&1
ansible-galaxy collection install  http://localhost/Rhce/community-general-7.3.0.tar.gz -p /root/RH294-M2/collections  > /dev/null 2>&1

echo -ne '##############             (50%)\r'

wget -P /root/RH294-M2 http://localhost/Rhce/initialscripts.sh    > /dev/null 2>&1

sh /root/RH294-M2/initialscripts.sh > /dev/null 2>&1
echo -ne '###########################(100%)\n'
