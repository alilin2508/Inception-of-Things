#!/bin/sh

echo "--Add loadBalancer mapping to app bonus--"
k3d cluster edit hrazanamS --port-add "8886:8886@loadbalancer"
