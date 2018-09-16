docker build -t michael4reynolds/multi-client ./client
docker build -t michael4reynolds/multi-server ./server
docker build -t michael4reynolds/multi-worker ./worker

docker push michael4reynolds/multi-client
docker push michael4reynolds/multi-server
docker push michael4reynolds/multi-worker

kubectl get deployments
kubectl delete deployment client-deployment
kubectl get services
kubectl delete service client-node-service

# kubectl delete daemonsets,replicasets,services,deployments,pods,rc --all

ls
kubectl apply -f k8s
kubectl get deployments
kubectl get pods
kubectl get services