"""\
# 🚀 AWS EC2 Deployment with Terraform & GitHub Actions

This project automates the deployment of an EC2 instance on AWS using **Terraform**, secured with a dynamic security group configuration. It integrates **GitHub Actions** for CI/CD automation and implements **Trivy IaC scanning** for security checks on infrastructure code.

---

## 🧱 Features

- Deploys an EC2 instance in `eu-west-2` (London) region  
- Attaches a public Elastic IP (EIP)  
- Dynamically configures security group rules for ingress and egress  
- Uses **GitHub Actions** to automate:
  - Terraform initialization and deployment
  - Trivy IaC scans to identify vulnerabilities in Terraform files

---

## 🔧 Technologies Used

- **Terraform**
- **AWS**
- **GitHub Actions**
- **Trivy** (for Infrastructure as Code scanning)

---

## 🗂️ Directory Structure

- Dynamically configures security group rules for ingress and egress  
- Uses **GitHub Actions** to automate:
  - Terraform initialization and deployment
  - Trivy IaC scans to identify vulnerabilities in Terraform files

---

## 🔧 Technologies Used

- **Terraform**
- **AWS**
- **GitHub Actions**
- **Trivy** (for Infrastructure as Code scanning)

---

## 🗂️ Directory Structure

```
.
├── .github/workflows/
│   └── deploy.yml           # GitHub Actions pipeline
├── main.tf                  # Main Terraform configuration
├── variables.tf             # Variable definitions
├── outputs.tf               # Output values (e.g., public IP)
└── README.md                # Project documentation
```

---

## ⚙️ Terraform Setup

**Provider Configuration**  
Located in `main.tf`:

```hcl
provider "aws" {
  region = "eu-west-2"
}
```

**Resources Deployed:**

- `aws_instance` – EC2 instance with tags and key pair
- `aws_security_group` – Dynamic security group for HTTP/HTTPS/SSH
- `aws_eip` – Elastic IP for public access

---

## 🛡️ Security Groups

The security group uses Terraform `dynamic` blocks to manage ports:

**Ingress:** `80`, `443`  
**Egress:** `443`, `80`, `22`

You can customize these via:

```hcl
variable "ingressrules" {
  default = [80, 443]
}

variable "egressrules" {
  default = [443, 80, 22]
}
```

---

## 🔄 GitHub Actions Pipeline

- On every push or pull request to `main`:
  - Checks out the repository
  - Initializes Terraform
  - Runs `terraform plan` and `apply`
  - Scans Terraform code using Trivy

Example snippet (from `.github/workflows/deploy.yml`):

```yaml
- name: Run Trivy IaC scan
  run: trivy config .
```

---

## 🧪 Trivy IaC Scan

Before applying changes, the pipeline uses Trivy to detect potential misconfigurations and security issues in the Terraform code.

🔍 Trivy reports are logged directly in GitHub Actions.

---

## 📤 Output

After deployment, the public IP of the EC2 instance is displayed:

```hcl
output "EIP" {
  value = aws_eip.mynewlb.public_ip
}
```

---

## ✅ Prerequisites

- AWS account with appropriate permissions
- Terraform installed locally (optional for manual deployment)
- GitHub repository with secrets (if required)
- GitHub Actions enabled

---

## 📌 Notes

- Replace placeholders in your Terraform backend block (`bucket`, `dynamodb_table`, `key_name`) before deployment.
- Always review Trivy scan results before applying changes to production.
# 🚀 AWS EC2 Deployment with Terraform & GitHub Actions

This project automates the deployment of an EC2 instance on AWS using **Terraform**, secured with a dynamic security group configuration. It integrates **GitHub Actions** for CI/CD automation and implements **Trivy IaC scanning** for security checks on infrastructure code.

---

## 🧱 Features

- Deploys an EC2 instance in `eu-west-2` (London) region  
- Attaches a public Elastic IP (EIP)  