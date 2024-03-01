module "website_s3_bucket" {
  source = "./modules/S3"
  error_document = "error.html"
  index_document = "index.html"
  static_website_bucket_name = "github-copilot-website-bucket-test"
}

module "website_cloudfront" {
  source                           = "./modules/CloudFront"
  bucket_regional_domain_name      = module.website_s3_bucket.s3_bucket_regional_domain_name
  index_document                   = "index.html"
}