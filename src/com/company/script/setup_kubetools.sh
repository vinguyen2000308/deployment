#!/bin/bash
#Installation for worker node
# kubeadm installation instructions as on
# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/

#Install Java and Docker
apt-get update
apt-get upgrade
sudo apt install openjdk-17-jre-headless
sudo apt  install docker.io
#Install cri-dockerd
wget https://github.com/Mirantis/cri-dockerd/releases/download/v0.2.1/cri-dockerd-0.2.1.20220525024524.cb92d7b-0.el7.x86_64.rpm
sudo apt-get install alien dpkg-dev debhelper build-essential
alien cri-dockerd-0.2.1.20220525024524.cb92d7b-0.el7.x86_64.rpm
sudo dpkg -i cri-dockerd_0.2.1.20220525024524.cb92d7b-1_amd64.deb

# Install Kubetools
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# Set iptables bridging
cat <<EOF >/etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system
