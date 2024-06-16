# AWS Microsite Infrastructure with Terraform

This project sets up the necessary AWS infrastructure for hosting a microsite using Terraform. It includes configurations for S3 and cloudfront-distribution.
## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Terraform](https://www.terraform.io/downloads.html) (version 0.12 or later)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Git](https://git-scm.com/)

Additionally, you need to configure your AWS credentials. You can do this by running:

```bash

aws configure

Getting Started
Clone the Repository

Clone this repository to your local machine using the following command:

bash
Copy code
git clone https://github.com/yourusername/aws-microsite-terraform.git
cd aws-microsite-terraform
Initialize Terraform

Initialize Terraform to install the necessary providers and modules:

bash
Copy code
terraform init
Review and Modify Variables

Review the variables.tf file and modify the variables as necessary to match your desired configuration. You can also create a terraform.tfvars file to specify your variables.

Plan the Infrastructure

Generate an execution plan to review the changes that Terraform will apply:

bash
Copy code
terraform plan
Apply the Configuration

Apply the Terraform configuration to create the AWS infrastructure:

bash
Copy code
terraform apply
Confirm the action by typing yes when prompted.