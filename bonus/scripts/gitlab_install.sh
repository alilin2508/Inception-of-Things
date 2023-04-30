#!/bin/sh

echo "DEPENDENCIES INSTALLATION"
sudo yum install -y curl policycoreutils-python openssh-server postfix 

sudo systemctl enable postfix && sudo systemctl start postfix

echo "GITLAB CE INSTALLATION"
echo "Run the repository script from gitlab.com"
cd /tmp
sudo yum -y install wget
sudo yum -y install nano
wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh

echo "Install the repository"
sudo bash script.rpm.sh

echo "Then, install GitLab CE:"
sudo yum -y install gitlab-ce


echo "GITLAB CONFIGURATION"
echo "1) Replace external ip ''https://example.com'' with ''http://192.168.56.112'' in /etc/gitlab/gitlab.rb (use nano) "
echo "2) execute : sudo gitlab-ctl reconfigure"
echo "3) connect UI gitlab and create your repository alilin/wil-playground in root"
echo "4) Make sure you have pull the docker images will-playground "
