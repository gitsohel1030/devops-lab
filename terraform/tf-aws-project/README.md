# Terraform AWS Core Infrastructure
 
This repository contains a **production-grade Terraform infrastructure baseline** designed using **modular architecture, strict environment isolation, and security-first AWS networking principles**.
 
The project focuses on building a **scalable and extensible AWS platform layer** that can support modern workloads such as auto-scaled services, container platforms, and observability stacks.
 
The emphasis is on **correct design, safe evolution, and interview-ready clarity**, not on deploying applications.
 
---
 
## 📌 What This Project Provisions
 
### Core Infrastructure
- Custom Amazon VPC with planned CIDR ranges
- Public subnets across availability zones
- Internet Gateway
- Route tables and associations
- Secure networking boundaries
 
### Platform Components
- Application Load Balancer (ALB)
- Target Groups with health checks
- HTTP Listener
- Security groups with explicit trust relationships
 
### Terraform Architecture
- Fully modular design
- Environment-specific root modules
- Remote state with locking (S3 + DynamoDB)
- Explicit data flow using outputs and inputs
- No hard-coded infrastructure values
 
---
 
## 🧠 Architectural Principles
 
This repository is built around the following principles:
 
- **Clear separation of responsibilities**
- **One responsibility per module**
- **Root modules orchestrate, child modules implement**
- **No cross-module lookups**
- **Terraform state as the source of truth**
- **Security groups define trust, not CIDRs**
- **Infrastructure first, workloads later**
 
Terraform is used to provision **platform infrastructure**, not application logic.
 
---
 
## 📂 Repository Structure
 
```text
terraform-aws-core/
├── modules/
│   ├── vpc/                     # VPC, subnets, IGW, routing
│   ├── security-group/
│   │   ├── alb/                 # ALB security group (public entry)
│   │   └── ec2/                 # EC2 security group (backend)
│   ├── alb/                     # ALB + Target Group + Listener
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
 