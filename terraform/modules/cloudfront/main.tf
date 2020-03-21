
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.s3_bucket_regional_domain_name
    origin_id = local.website_origin_id
    origin_path = "dist/"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/${local.website_origin_id}"
    }
  }
  origin {
    domain_name = var.s3_bucket_regional_domain_name
    origin_id = local.asset_origin_id
    origin_path = "assets/system/"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/${local.asset_origin_id}"
    }
  }
  enabled = true
  is_ipv6_enabled = true
  default_root_object = "index.html"
  aliases = [
    var.website_dns,
    var.assets_dns
  ]
  default_cache_behavior {
    allowed_methods = [
      "HEAD",
      "GET",
      "OPTIONS"
    ]
    cached_methods = [
      "GET",
      "HEAD"
    ]
    target_origin_id = local.website_origin_id

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "allow-all"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }
  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA"]
    }
  }
  tags {
    Environment = var.env
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

