All backend compute runs in **private subnets** and is accessible **only through the Application Load Balancer (ALB)**.  
No EC2 instance is directly exposed to the internet.
 
---
 
## 🚀 What This Platform Provisions
 
### Networking
- Custom VPC with planned CIDR ranges
- Multiple **public subnets** across Availability Zones
- Multiple **private subnets** across Availability Zones
- Internet Gateway for public routing
- NAT Gateways (per AZ) for outbound access from private subnets
- Route tables and explicit subnet associations
 
### Traffic & Security
- Application Load Balancer (ALB) as the single public entry point
- Target Group with health checks
- HTTP listener
- Security groups enforcing strict trust boundaries:
  - Public ingress allowed **only** to the ALB
  - Backend instances accept traffic **only from the ALB security group**
  - No direct public access to backend compute
 
### Compute
- Launch Template defining immutable EC2 configuration
- Auto Scaling Group (ASG) for self-healing and elasticity
- EC2 instances launched dynamically by ASG
- Instances distributed across multiple Availability Zones
- All compute isolated within private subnets
 
### Scaling & Observability
- Target tracking Auto Scaling policy based on **ASG average CPU utilization**
- CloudWatch alarms providing infrastructure-level visibility into:
  - Sustained CPU pressure
  - ASG capacity and self-healing health
  - ALB target health (user-facing availability)
 
Alarms are designed for **human visibility**, not automated remediation.
 
---
 
## 🧠 Design Principles
 
This platform is built around the following principles:
 
- **Single responsibility per module**
- **Root modules orchestrate; child modules implement**
- **Explicit data flow via outputs and inputs**
- **No cross-module lookups**
- **Immutable compute (Launch Template + ASG)**
- **High availability via multi-AZ design**
- **Elasticity using AWS-managed target tracking**
- **Terraform state as the source of truth**
 
Terraform is used strictly to provision **infrastructure and platform layers**, not application logic.
 
---
 
## 📂 Repository Structure
 
```text
terraform-aws-core/
├── modules/
│   ├── vpc/                   # VPC, subnets, IGW, NAT, routing
│   ├── security-group/
│   │   ├── alb/               # ALB security group (public edge)
│   │   └── ec2/               # EC2 security group (backend)
│   ├── alb/                   # ALB, Target Group, Listener
│   ├── launch-template/       # Immutable EC2 definition
│   ├── asg/                   # Auto Scaling Group and scaling policies
│   └── monitoring/            # CloudWatch alarms (infra-level)
│
├── envs/
│   ├── dev/                   # Development environment (root module)
│   │   ├── backend.tf
│   │   ├── provider.tf
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   │
│   └── prod/                  # Production environment (root module)
│       ├── backend.tf
│       ├── provider.tf
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
│
└── README.md
 