sudo -u student wget -P /home/student/data http://localhost/Rhce/admin.yml       > /dev/null 2>&1
sudo -u student  ansible-playbook /home/student/data/admin.yml      > /dev/null 2>&1
