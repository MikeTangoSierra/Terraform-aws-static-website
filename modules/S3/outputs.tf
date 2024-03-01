output "s3_bucket_domain_name" {
  value = aws_s3_bucket.static_website_bucket.bucket_domain_name
}

output "s3_bucket_regional_domain_name" {
  value = aws_s3_bucket.static_website_bucket.bucket_regional_domain_name
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.static_website_bucket.arn
}