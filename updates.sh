#!/bin/bash 

echo "Starting updates" >> /vagrant/system_updates.txt

yum -y update

sleep 10

echo "Starting upgrade" >> /vagrant/system_updates.txt 

yum -y upgrade 

sleep 10

reboot 


