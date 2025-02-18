# DevOps Tools Showoff

Goal of this project is to showoff skills in mainstream Cloud DevOps tools such as:  
+ AWS as Cloud provider  
+ Terraform for IaC  
+ Helm Charts for K8s infrastructure management  
+ Github Actions for CI/CD pipeline  
+ Prometheus + Grafana for monitoring  


# Installing Prometheus/Grafana on EKS with Helm

```
# Update the kubectl context to connect with the EKS cluster
aws eks update-kubeconfig --region <your-region> --name <your-cluster-name>

# Create a namespace for monitoring components
kubectl create namespace monitoring

# Add official Helm repositories for Prometheus and Grafana
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts

# Update Helm repositories to get the latest chart versions
helm repo update

# Install Prometheus, Grafana, and related components using kube-prometheus-stack
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring

```
