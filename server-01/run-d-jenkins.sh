#!/bin/bash

# drop if something goes wrong
set -e

sudo yum update -y

sudo yum install -y docker

sudo service docker start
sudo usermod -a -G docker ec2-user

sudo chkconfig docker on

sudo docker pull jenkins/jenkins:lts

sudo docker run -d --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  jenkins/jenkins:lts
