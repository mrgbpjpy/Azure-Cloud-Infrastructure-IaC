
# 🌩️ Azure Cloud Infrastructure IaC (Publix-Aligned Starter)

This project provides a **production-ready Terraform stack for Azure**, showcasing cloud engineering, infrastructure automation, and DevOps best practices aligned with Publix Technology’s *Principal Software Engineer – Cloud Engineering* role.

---

## 🎯 Purpose
Provision a secure, scalable, and observable Azure environment using **Infrastructure as Code (IaC)** with Terraform and **Continuous Deployment** through GitHub Actions (OIDC-based authentication — no client secrets).

This template deploys:
- Azure Resource Group
- Log Analytics Workspace
- Application Insights (connected to LAW)
- Azure Container Registry (ACR)
- Linux App Service Plan
- Linux Web App (HTTPS-only) hosting your Docker container
- *(Optional)* Azure Kubernetes Service (AKS) cluster (commented out in `main.tf`)

---

## 🧱 Architecture Overview

```text
GitHub Actions (CI/CD)
       │
       ▼
Terraform (Plan & Apply)
       │
       ▼
Azure Resource Group
 ├── Log Analytics Workspace
 ├── Application Insights
 ├── Container Registry (ACR)
 ├── App Service Plan (Linux)
 └── Linux Web App (Docker container)
```

All services are tagged, monitored, and HTTPS-only.  
Telemetry is automatically streamed to Azure Monitor via Application Insights.

---

## 🗂️ Repository Structure

```text
azure-cloud-iac/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── providers.tf
├── docs/
│   └── architecture.md
├── .github/
│   └── workflows/
│       └── terraform.yml
└── .gitignore
```

---

## ⚙️ Prerequisites

Before running this project, you need:
1. **Azure Subscription** with Contributor access  
2. **Terraform** (≥ 1.6.0) installed locally  
3. **GitHub Actions OIDC setup** with the following secrets:

| Secret Name | Description |
|--------------|--------------|
| `AZURE_CLIENT_ID` | Azure App Registration client ID |
| `AZURE_TENANT_ID` | Azure tenant ID |
| `AZURE_SUBSCRIPTION_ID` | Azure subscription ID |

> Configure a Federated Credential in your Azure App Registration to enable passwordless OIDC login from GitHub Actions.

---

## 🚀 Deployment Instructions

### Local Deployment
```bash
cd terraform
terraform init
terraform plan -var="docker_image=yourdockerhubuser/yourimage:tag"
terraform apply -auto-approve -var="docker_image=yourdockerhubuser/yourimage:tag"
```

### Outputs
Once deployment completes, you’ll see:
- App Service default hostname  
- Resource Group name  
- ACR login server  
- Log Analytics Workspace ID  

### Destroy Resources
```bash
terraform destroy -auto-approve
```

---

## 🔄 CI/CD Pipeline

This project includes a ready-to-use GitHub Actions workflow:

| Event | Action |
|--------|---------|
| **Pull Request** | Runs `terraform validate` and `terraform plan` |
| **Push to main** | Executes `terraform apply` automatically |

The workflow uses **OpenID Connect (OIDC)** for Azure authentication — no secrets file needed.

---

## ⚡ Configuration Variables

You can override defaults in `variables.tf` during deployment:

```bash
terraform apply   -var="project_name=pubcloud"   -var="environment=dev"   -var="location=eastus"   -var="docker_image=erickesquilin/myapp:1.0.0"   -var="container_port=8080"
```

---

## 📊 Observability

- **Application Insights**: Performance, failure, and dependency tracking  
- **Log Analytics Workspace**: Centralized log storage  
- **HTTP Logs**: Retained for 7 days (35 MB limit)  

---

## 🧩 Optional AKS Cluster

Uncomment the AKS section in `main.tf` to provision a minimal Azure Kubernetes Service cluster.

For production workloads, configure:
- AAD-managed identities  
- Separate system/user node pools  
- Ingress controller (NGINX or AGIC)  
- Azure CNI networking with policies  

---

## 🧠 Publix Alignment Highlights

| Publix Requirement | Demonstrated In This Project |
|--------------------|-------------------------------|
| Infrastructure as Code | Terraform configuration for Azure |
| Azure Services | App Service, ACR, Insights, LAW, AKS (optional) |
| CI/CD Automation | GitHub Actions workflow |
| Cloud Security | HTTPS-only, OIDC auth (no stored credentials) |
| Documentation | Architecture diagram + step-by-step README |
| Monitoring | Application Insights and Log Analytics integration |

---

## 🧹 Cleanup
```bash
cd terraform
terraform destroy -auto-approve
```

---

## 📄 License
MIT License – free to use and modify.

---

## 👨‍💻 Author
**Erick Esquilin**  
M.S. in Computer Science – Colorado Technical University  
Cloud & Automation Engineer | Publix-Aligned Portfolio Project  
📍 [Portfolio](https://erick-esquilin-portfolio.vercel.app)
