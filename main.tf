terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket = "sctp-ce10-tfstate"
    #checkov:skip=CKV_AWS_20:The bucket is a public static content host
    key    = "kvin"  #Change this
    region = "ap-southeast-1"
  }
}



resource "aws_s3_bucket" "s3_tf" {
  bucket_prefix =  "kvin" # Set your bucket name here
}