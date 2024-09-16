#!/bin/bash

sudo add-apt-repository -y main

sudo add-apt-repository -y universe


apt-get -y update

apt-get -y install docker

apt-get -y install docker.io

apt-get -y install ansible

apt-get -y install sshpass

if [ -f /etc/ansible/ansible.cfg ]

then

        sed -i 's/#host_key_checking/host_key_checking/' /etc/ansible/ansible.cfg

else

        mkdir /etc/ansible/

        touch /etc/ansible/ansible.cfg

        echo -e "[defaults]\nhost_key_checking = False" > /etc/ansible/ansible.cfg

fi



docker pull autopilotdevops/ansible

docker run -itd autopilotdevops/ansible

docker run -itd autopilotdevops/ansible

docker run -itd autopilotdevops/ansible



count=1

docker ps -a -q | while read line;

do

IP=`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $line`

echo "webserver${count} ansible_connection=ssh ansible_user=root ansible_password=Devops ansible_host=$IP" >> /root/inventory.txt

count=$((count + 1))

done




#inventory file
webserver1 ansible_connection=ssh ansible_user=root ansible_password=Devops ansible_host=172.17.0.4
webserver2 ansible_connection=ssh ansible_user=root ansible_password=Devops ansible_host=172.17.0.3
webserver3 ansible_connection=ssh ansible_user=root ansible_password=Devops ansible_host=172.17.0.2

[webservers]
webserver[1:3]
