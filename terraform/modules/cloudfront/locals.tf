
locals {
  website_origin_id = var.s3_bucket_name + '_' + var.website_dns
  asset_origin_id   = var.s3_bucket_name + '_' + var.assets_dns
}
