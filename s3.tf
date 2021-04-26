resource "aws_s3_bucket" "master" {
  bucket = "kubernetesosmaster"
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
    ownership = "super-administrator"
  }
}

resource "aws_s3_bucket" "worker" {
  bucket = "kubernetesosworker"
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
    ownership = "super-administrator"
  }
}

resource "aws_s3_bucket" "saasproj" {
  bucket = "saasproj"
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
    ownership = "super-administrator"
  }
}

resource "aws_s3_bucket_object" "instances_folder" {
  bucket = aws_s3_bucket.saasproj.id
  acl = "private"
  key = "instances/"
  content_type = "application/x-directory"

  tags = {
    ownership = "super-administrator"
  }
}
