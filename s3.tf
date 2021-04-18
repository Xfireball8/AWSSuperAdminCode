module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  
  bucket = "SaaSProj"
  acl = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_object" "ostree_folder" {
  bucket = module.s3_bucket.bucket_id
  acl = "private"
  key = "ostree/"
  content_type = "application/x-directory"
}

resource "aws_s3_bucket_object" "ostree_master_folder" {
  bucket = module.s3_bucket.bucket_id
  acl = "private"
  key = "ostree/master/"
  content_type = "application/x-directory"
}

resource "aws_s3_bucket_object" "ostree_worker_folder" {
  bucket = module.s3_bucket.bucket_id
  acl = "private"
  key = "ostree/worker/"
  content_type = "application/x-directory"
}
