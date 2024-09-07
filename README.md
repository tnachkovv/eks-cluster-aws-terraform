
# AWS EKS Cluster Creation with multi-tier Application
 
This repository contains Terraform and Kubernetes manifests for deploying a multi-tier application in AWS using EKS (Elastic Kubernetes Service). The architecture includes a VPC, subnets, NAT gateway, internet gateway, and a fully managed Kubernetes environment with the necessary IAM roles and node groups.
 
## Project Structure
 
###  AWS Infrastructure Setup (Terraform)
This section uses Terraform to provision the infrastructure in AWS, including VPC, subnets, internet gateway, NAT gateway, and the EKS cluster.
 
####  Provider
- Defines the AWS provider with the required region and access credentials to provision resources in AWS.
 
#### VPC (Virtual Private Cloud)
- **VPC**: A dedicated network for your EKS cluster, defined by a CIDR block.
- **Internet Gateway (IGW)**: Allows the VPC to communicate with the internet.
- **Subnets**: Private and public subnets across multiple availability zones.
- **NAT Gateway**: Enables outbound internet traffic for resources in private subnets.
  
#### Routes
- **Route Tables**: Configure routing for public and private subnets, allowing communication through IGW and NAT gateway.
 
### 2. EKS Cluster and Node Groups
- **EKS Cluster**: A managed Kubernetes control plane for deploying containerized applications.
- **Node Groups**: EC2 instances running as worker nodes, managed by the EKS control plane.
  
### 3. IAM Roles and Policies
IAM roles and policies are defined for various components that need access control and permissions.
 
#### IAM Roles:
- **iam-odc**: Provides necessary access control for managing certain resources.
- **iam-test**: A test IAM role for limited access to specific resources.
- **iam-auroscaler**: Provides permissions for the Kubernetes Cluster Autoscaler to dynamically adjust the number of worker nodes in the EKS cluster.
 
---
 
### 4. Kubernetes Manifests
Kubernetes manifests are used to define the application services, deployments, and infrastructure like autoscaling and ingress for the 3-tier application. These manifests are deployed to the EKS cluster.
 
#### Backend Deployment
- Defines the deployment for the backend service, specifying replicas, container images, and resource requests.
  
#### Backend Service
- Exposes the backend deployment within the cluster via a ClusterIP service to communicate with other internal services.
 
#### Frontend Deployment
- Defines the deployment for the frontend service with multiple replicas for scalability.
 
#### Frontend Service
- Exposes the frontend deployment via a LoadBalancer service for external access.
 
#### Cluster Autoscaler Deployment
- Deploys the Cluster Autoscaler to dynamically scale the number of worker nodes based on resource usage and application demand.
 
#### Ingress
- Manages the routing of external traffic to the services using Ingress resources and public-facing load balancers.
 
#### Public Load Balancer
- A public-facing load balancer to route internet traffic to the frontend service through the Ingress.
 
#### Secrets
- Stores sensitive information like database credentials, API keys, etc., for use by different services within the cluster.
 
---
 
## Infrastructure Setup Steps
 
1. **Initialize Terraform**:
   - Run `terraform init` to initialize Terraform in the project directory.

2. **Plan the Infrastructure**:
   - Run `terraform plan` to review the resources that will be created and ensure the configuration is correct.
 
3. **Apply the Configuration**:
   - Run `terraform apply` to provision the resources in your AWS account.

4. ***Apply Manifest files**:
   - Run `kubectl apply k8s_manifests` to provision k8s services. 
