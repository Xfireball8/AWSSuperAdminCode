resource "aws_s3_bucket" "saasproj" {
  bucket = "saasproj"
  acl = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_object" "ostree_folder" {
  bucket = aws_s3_bucket.saasproj.id
  acl = "private"
  key = "ostree/"
  content_type = "application/x-directory"
}

resource "aws_s3_bucket_object" "ostree_master_folder" {
  bucket = aws_s3_bucket.saasproj.id
  acl = "private"
  key = "ostree/master/"
  content_type = "application/x-directory"
}

resource "aws_s3_bucket_object" "ostree_worker_folder" {
  bucket = aws_s3_bucket.saasproj.id
  acl = "private"
  key = "ostree/worker/"
  content_type = "application/x-directory"
}

resource "aws_s3_bucket_object" "instances_folder" {
  bucket = aws_s3_bucket.saasproj.id
  acl = "private"
  key = "instances/"
  content_type = "application/x-directory"
}
