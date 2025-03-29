#!/bin/bash

#Starting Script
echo "Running Shell Script"

# Updating server
wcho "Updating Packages"
sudo apt-get update -y


#Installing docker 
if ! command -v docker &> /dev/null
then
       echo "Installing docker"
       sudo apt-get install docker.io -y
else
       echo "Docker already installled"
fi


# Installing Java version
echo "installing java"
if ! jave -version &> /dev/null
then
       echo "Installing Java version 17"
       sudo apt install fontconfig openjdk-17-jre -y
else
       echo "Java already installled"
fi


# taking Jenkins keys on the server
echo "acquiring Jenkins keys"
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

#updating server with latest library
echo "Updating packages"
sudo apt-get update -y

#installing jenkins 
if ! systemctl is-active --quiet jenkins
then
       echo "Jenkins installtion started"
       sudo apt-get install jenkins -y
else
       echo "jenkins already installled"
fi

echo "Server setup completed successfully!"
