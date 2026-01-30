All backend compute runs in **private subnets** and is accessible **only through the ALB**.
 
---
 
## 🚀 What This Platform Provisions
 
### Networking
- Custom VPC with planned CIDR ranges
- Multiple **public subnets** across Availability Zones
- Multiple **private subnets** across Availability Zones
- Internet Gateway
- Route tables and subnet associations
 
### Traffic & Security
- Application Load Balancer (ALB)
- Target Group with health checks
- HTTP Listener
- Security groups with strict trust boundaries:
  - Public ingress only to ALB
  - Backend access only from ALB security group
 
### Compute
- Launch Templates (immutable instance definition)
- Auto Scaling Group (self-healing backend compute)
- EC2 instances launched dynamically by ASG
- Instances distributed across Availability Zones
 
### Terraform Design
- Fully modular architecture
- Environment-specific root modules
- Remote backend with locking (S3 + DynamoDB)
- Explicit data flow using module outputs and inputs
- No hardcoded infrastructure values
 
---
 
## 🧠 Design Principles
 
This platform is built using the following principles:
 
- **Single responsibility per module**
- **Root modules orchestrate, child modules implement**
- **No cross-module lookups**
- **Explicit dependencies via outputs and inputs**
- **Immutable compute (Launch Template + ASG)**
- **High Availability via multi-AZ design**
- **Terraform state as the source of truth**
 
Terraform is used to provision **infrastructure and platform layers**, not application logic.
 
---
 
## 📂 Repository Structure
 
```text
terraform-aws-core/
├── modules/
│   ├── vpc/                     # VPC, subnets, IGW, routing
│   ├── security-group/
│   │   ├── alb/                 # ALB security group (public edge)
│   │   └── ec2/                 # EC2 security group (backend)
│   ├── alb/                     # ALB, Target Group, Listener
│   ├── launch-template/         # Immutable EC2 definition
│   ├── asg/                     # Auto Scaling Group
│   └── ec2/                     # Deprecated single-instance module
│
├── envs/
│   ├── dev/                     # Development environment (root module)
│   │   ├── backend.tf
│   │   ├── provider.tf
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   │
│   └── prod/                    # Production environment (root module)
│       ├── backend.tf
│       ├── provider.tf
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
│
└── README.md
 