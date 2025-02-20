#!/bin/bash

# drop if something goes wrong
set -e

sudo yum update -y

sudo yum install -y docker

sudo service docker start
sudo usermod -a -G docker ec2-user

sudo chkconfig docker on