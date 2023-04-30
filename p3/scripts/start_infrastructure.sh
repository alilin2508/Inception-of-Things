#!/bin/sh

echo "--set current context into argocd namespace--"
kubectl config set-context --current --namespace=argocd

echo "--create the app (pod deployment and start the service)--"
argocd app create wil-playground --repo https://github.com/alilin2508/alilin.git --path wil-playground --dest-server https://kubernetes.default.svc --dest-namespace dev

echo "--sync --"
kubectl create namespace dev

echo "--sync --"
argocd app sync wil-playground 

echo "--sync policies--"
argocd app set wil-playground --sync-policy automated
argocd app set wil-playground --auto-prune
argocd app set wil-playground --self-heal

echo "--display application infos--"
argocd app get wil-playground

echo "--set current context changing current context--"
kubectl config set-context --current --namespace=dev

#Acces to external with ingress (port 80 mapped at k3d creation)
#either locahost:8081 or ip-ingress:80
echo "--apply the ingress file--"
/usr/local/bin/kubectl apply -f ../confs/ingress.yaml

##A LA MANO autre solution 
#kubectl port-forward #INSERT#SERVICENAME#HERE 8888:8888 -n dev
