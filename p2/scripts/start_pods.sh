#!/bin/sh

sleep 5

/usr/local/bin/kubectl create configmap app-one --from-file /vagrant/confs/html/app1/index.html --namespace=kube-system
/usr/local/bin/kubectl create configmap app-two --from-file /vagrant/confs/html/app2/index.html --namespace=kube-system
/usr/local/bin/kubectl create configmap app-three --from-file /vagrant/confs/html/app3/index.html --namespace=kube-system

/usr/local/bin/kubectl apply -f /vagrant/confs/app-one.yaml
/usr/local/bin/kubectl apply -f /vagrant/confs/app-two.yaml
/usr/local/bin/kubectl apply -f /vagrant/confs/app-three.yaml

/usr/local/bin/kubectl apply -f /vagrant/confs/ingress.yaml
