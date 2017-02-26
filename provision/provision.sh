#!/usr/bin/env bash

# Installing and enabling docker service
sudo yum update -y
sudo yum install -y docker
chkconfig docker on
service docker start