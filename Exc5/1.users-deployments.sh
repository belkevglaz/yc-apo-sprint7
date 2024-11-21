#!/usr/bin/env bash
kubectl run front-end-app --image=nginx --labels role=frontend --expose --port 80

kubectl run back-end-api --image=nginx --labels role=backend --expose --port 80

kubectl run admin-front-end-app --image=nginx --labels role=admin-frontend --expose --port 80

kubectl run admin-back-end-api --image=nginx --labels role=admin-backend --expose --port 80

