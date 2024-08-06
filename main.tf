terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "mlclmfrsr-tfstate"
    key     = "state/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}

module "mf-website" {
  source = "./modules/infrastructure"

  bucket_name    = "cfaber-webcontent"
  error_page     = "error.html"
  start_page     = "index.html"
  start_page_dir = "website/index.html"
  environment    = "production"
}
