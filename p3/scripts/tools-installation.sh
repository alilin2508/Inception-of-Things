#!/bin/sh

echo "---DOCKER INSTALLATION---"
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
echo "Add Docker’s official GPG key:"
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "Use the following command to set up the repository:"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Install docker engine"
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


echo "\n\n\n\n---K3D INSTALLATION (WGET)---"
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash


echo "\n\n\n\n---KUBECTL INSTALLATION (CURL)---"
echo "latest version"
 curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

echo "Make the kubectl binary executable"
chmod +x ./kubectl

echo "Move the binary in to your PATH."
sudo mv ./kubectl /usr/local/bin/kubectl

echo "ARGOCD installation"
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

