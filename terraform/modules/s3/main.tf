resource "aws_s3_bucket" "bucket" {
  provider = aws
  bucket   = var.bucket-name
  acl      = "private"

  tags = {
    Project     = var.project-name
    Environment = var.env
  }
}
