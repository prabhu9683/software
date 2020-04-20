#!/bin/bash
echo "################ Install openssh-server ##############"
sudo apt-get update 
sudo apt-get install openssh-server
sudo service ssh status
echo "################ Install Git-Version ######"
sudo apt-get update 
sudo apt install git -y 
sudo git --version
echo "################# Install python3.6 ########" 
sudo apt-get update 
sudo apt-get install python3.6 
sudo apt-get wget 
sudo apt-get unzip 
echo "################ Install terraform ###"
sudo apt-get install unzip -y
sudo wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip 
sudo unzip terraform_0.12.24_linux_amd64.zip  
sudo mv terraform /usr/local/bin/ 
terraform --version
echo"######## Build a custom docker images with following software installed #####"
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    bash \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce -y
echo "######################"
sudo docker --version
sudo docker info
sudo docker images
sudo docker ps 
echo" ################ Install Docker-Compose ################"
curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
cd /usr/local/bin
sudo chmod +x /usr/local/bin/docker-compose
echo "##################"
docker-compose --version
echo "################ Install jenkins #########"
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "################## Install maven ###############"
sudo apt-get update -y
sudo apt-get upgrade -y
cd /opt/
sudo wget http://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
sudo tar -xvzf apache-maven-3.6.3-bin.tar.gz
sudo mv apache-maven-3.6.3 maven
sudo rm apache-maven-3.6.3-bin.tar.gz
sudo touch /etc/profile.d/mavenenv.sh
sudo chmod o+w /etc/profile.d/mavenenv.sh
echo export M2_HOME=/opt/maven export PATH=${M2_HOME}/bin:${PATH} > /etc/profile.d/mavenenv.sh
sudo chmod ugo+x,o-w /etc/profile.d/mavenenv.sh
source /etc/profile.d/mavenenv.sh
sudo apt install maven -y
sudo mvn --version





