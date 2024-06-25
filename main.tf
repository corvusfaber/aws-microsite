terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

   backend "s3" {
    bucket         = "mf-corvus-tfstate"
    key            = "state/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "mf-corvus-tf-lockId"
  }
}

module "mf-website" {
  source = "./modules/infrastructure"

  bucket_name      = "cfaber-webcontent"
  error_page       = "error.html"
  start_page       = "index.html"
  start_page_dir   = "website/index.html"
  origin_access_id = "origin-access-identity/cloudfront/E1UH4UX6RASB3U"
  environment      = "production"
}
