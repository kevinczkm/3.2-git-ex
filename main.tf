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

data "aws_caller_identity" "current" {}

# locals {
#   name_prefix = "split("/", "${data.aws_caller_identity.current.arn}")[1]}"
# }

locals {
  name_prefix = split("/", data.aws_caller_identity.current.arn)[1]
}


resource "aws_s3_bucket" "s3_tf" {
  bucket_prefix = lower("${local.name_prefix}-sctp-bkt")
}