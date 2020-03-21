output "s3_bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}
output "s3_bucket_regional_domain_name" {
  value = aws_s3_bucket.bucket.bucket_regional_domain_name
}