#/bin/bash

dnf install httpd -y     > /dev/null 2>&1
systemctl enable --now  httpd   > /dev/null 2>&1

echo -ne '#####                      (33%)\r'

cp -rf Rhce  /var/www/html/Rhce     > /dev/null 2>&1
systemctl  restart httpd   > /dev/null 2>&1
sudo -u student  mkdir /home/student/data
sudo -u student  cd /home/student/data
wget http://localhost/Rhce/mock2/inventory    > /dev/null 2>&1
wget http:///localhost/mock2/ansible.cfg  > /dev/null 2>&1
sudo -u student  mkdir /home/student/data/collections
sudo -u student  ansible-galaxy collection install  http://localhost/Rhce/ansible-posix-1.4.0.tar.gz -p collections  > /dev/null 2>&1
sudo -u student  ansible-galaxy collection install  http://localhost/Rhce/redhat-rhel_system_roles-1.0.0.tar.gz -p collections  > /dev/null 2>&1
sudo -u student  ansible-galaxy collection install  http://localhost/Rhce/community-general-7.3.0.tar.gz -p collections  > /dev/null 2>&1

echo -ne '##############             (50%)\r'

sudo -u student  wget  http://content/Rhce/initialscripts.sh    > /dev/null 2>&1

sudo -u student sh initialscripts.sh > /dev/null 2>&1
echo -ne '###########################(100%)\n'
