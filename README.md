
## AWS Microsite Infrastructure with Terraform

This project sets up the necessary AWS infrastructure for hosting a microsite using Terraform.

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Terraform]
- [AWS CLI]
- [Git]

Additionally, you need to configure your AWS credentials. You can do this by running:

```bash
aws configure
```

## Getting Started

1. **Clone the Repository**

   Clone this repository to your local machine using the following command:

   ```bash
   git clone https://github.com/yourusername/aws-microsite-terraform.git
   cd aws-microsite-terraform
   ```

2. **Initialize Terraform**

   Initialize Terraform to install the necessary providers and modules:

   ```bash
   terraform init
   ```

3. **Review and Modify Variables**

   Review the `variables.tf` file and modify the variables as necessary to match your desired configuration. You can also create a `terraform.tfvars` file to specify your variables.

4. **Plan the Infrastructure**

   Generate an execution plan to review the changes that Terraform will apply:

   ```bash
   terraform plan
   ```

5. **Apply the Configuration**

   Apply the Terraform configuration to create the AWS infrastructure:

   ```bash
   terraform apply
   ```

   Confirm the action by typing `yes` when prompted.

## Infrastructure Components

The Terraform configuration sets up the following AWS resources:

- **S3 Bucket**: Storage for static assets.
- **Cloudfront distribution**: Accelerates and secures the delivery of the static website hosted on S3, ensuring fast, reliable, and global access for users.

## Directory Structure
 
```
aws-microsite-terraform/
├── main.tf                        # Main configuration file
├── variables.tf                   # Variable definitions
├── outputs.tf                     # Output definitions
├── s3.tf                          # S3 bucket definitions
├── bucket_infrastructure.tf       # Output definitions
├── cloudfront_distriution.tf      # S3 bucket definitions

```

## Cleanup

To destroy the infrastructure and avoid incurring charges, run:

```bash
terraform destroy
```

Confirm the action by typing `yes` when prompted.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or support, please open an issue or contact the project maintainer at [malcolmfrsr@gmail.com](mailto:malcolmfrsr@gmail.com).

```

Feel free to customize this `README.md` to better suit your project's specifics and any additional details you wish to include.