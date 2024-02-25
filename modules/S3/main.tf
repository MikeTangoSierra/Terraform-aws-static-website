# Create a S3 bucket for website code to live in.
resource "aws_s3_bucket" "static_website_bucket" {
  bucket = var.static_website_bucket_name
}

# Create the ACL for our S3 bucket.
resource "aws_s3_bucket_acl" "static_website_bucket_acl" {
  bucket = aws_s3_bucket.static_website_bucket.id

  acl = "public-read"
}

# Create the policy for our S3 bucket.
resource "aws_s3_bucket_policy" "static_website_bucket_policy" {
  bucket = aws_s3_bucket.static_website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = "s3:GetObject",
        Resource = "${aws_s3_bucket.static_website_bucket.arn}/*"
      }
    ]
  })
}

# Create the website configuration for our S3 bucket.
resource "aws_s3_bucket_website" "static_website_bucket_website" {
  bucket = aws_s3_bucket.static_website_bucket.id

  index_document = var.index_document
  error_document = var.error_document
}