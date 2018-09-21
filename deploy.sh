docker build -t michael4reynolds/multi-client:latest -t michael4reynolds/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t michael4reynolds/multi-server:latest -t michael4reynolds/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t michael4reynolds/multi-worker:latest -t michael4reynolds/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push michael4reynolds/multi-client:latest
docker push michael4reynolds/multi-server:latest
docker push michael4reynolds/multi-worker:latest

docker push michael4reynolds/multi-client:$SHA
docker push michael4reynolds/multi-server:$SHA
docker push michael4reynolds/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=michael4reynolds/multi-client:$SHA
kubectl set image deployments/server-deployment server=michael4reynolds/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=michael4reynolds/multi-worker:$SHA
