#!/bin/sh

echo "--cluster server hrazanamS creation--"
k3d cluster create hrazanamS --port "8081:80@loadbalancer"

echo "--Argocd namespace creation + init argocd ressources--"
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


echo "--1) Get the initial argocd mdp (mdp_init file) :  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d > mdp_init   --"
echo "--2) Port forward the argocd API to port 7894 :  kubectl port-forward service/argocd-server -n argocd 7894:443  --"
echo "--3) Login to argocd CLI with (admin, *mdp_init*) : argocd login localhost:7894  --"
echo "WARNING: Make sure you have pull the docker image will-playground"



##A LA MANO
##To connect to the ArgoAPI GUI
#echo "--port forwarding Argo API : 443 to 7894 in host machine--"
#kubectl port-forward service/argocd-server -n argocd 7894:443

##need to grep and prompt(find with kubectl get all -o wide -n argocd)
#echo "--Please log to your argocd API server :\nlogin: admin // mdp: check the file mdp_argoAPI--"
#argocd login localhost:7894 



