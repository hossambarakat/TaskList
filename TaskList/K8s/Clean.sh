
kubectl delete service mssql-service --ignore-not-found=true
kubectl delete service tasks-app-svc --ignore-not-found=true
kubectl delete deployment tasks-app-deployment --ignore-not-found=true
kubectl delete deployment mssql-deployment --ignore-not-found=true
kubectl delete ReplicaSet tasks-app-rs --ignore-not-found=true
kubectl delete pod tasks-app --ignore-not-found=true
kubectl delete pvc,pv --all --ignore-not-found=true
kubectl delete secret mssql --ignore-not-found=true
clear