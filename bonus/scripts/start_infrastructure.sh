#!/bin/sh

echo "--set current context into argocd namespace--"
kubectl config set-context --current --namespace=argocd

echo "--create the app (pod deployment and start the service)--"
argocd app create wil-playground-bonus --repo http://192.168.56.112/root/alilin.git --path wil-playground --dest-server https://kubernetes.default.svc --dest-namespace gitlab 

echo "--Create namespace gitlab --"
kubectl create namespace gitlab

echo "--sync --"
argocd app sync wil-playground-bonus

echo "--sync policies--"
argocd app set wil-playground-bonus --sync-policy automated
argocd app set wil-playground-bonus --auto-prune
argocd app set wil-playground-bonus --self-heal

echo "--display application infos--"
argocd app get wil-playground-bonus
