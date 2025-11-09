
# Architecture (High Level)

```
Developer (GitHub) 
     |
     |  push / PR
     v
GitHub Actions (Terraform CI)
     |
     |  az login (OIDC) + terraform plan/apply
     v
Azure Resource Group
  ├─ Log Analytics Workspace
  ├─ Container Registry (ACR)
  ├─ App Service Plan (Linux)
  └─ Linux Web App (Docker container from Docker Hub)
         └─ Application Insights (connected to LAW)
```

- **Primary goal**: Stand up a production-ready baseline with observability and HTTPS-only web app hosting a container image.
- **Optional**: Uncomment the AKS block in `main.tf` to create a starter cluster.
