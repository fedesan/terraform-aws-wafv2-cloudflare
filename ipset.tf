resource "aws_wafv2_ip_set" "IPv4RegionCloudflareIPSet" {
  name  = "IPv4RegionalCloudflareIPSet"
  scope = "REGIONAL"
  ip_address_version = "IPV4"
  addresses = var.ipv4address
}

resource "aws_wafv2_ip_set" "IPv6RegionCloudflareIPSet" {
  name  = "IPv6RegionalCloudflareIPSet"
  scope = "REGIONAL"
  ip_address_version = "IPV6"
  addresses = var.ipv6address
}

resource "aws_wafv2_ip_set" "IPv4CloudfrontCloudflareIPSet" {
  name  = "IPv4CloudfrontCloudflareIPSet"
  scope = "CLOUDFRONT"
  ip_address_version = "IPV4"
  addresses = var.ipv4address
}

resource "aws_wafv2_ip_set" "IPv6CloudfrontCloudflareIPSet" {
  name  = "IPv6CloudfrontCloudflareIPSet"
  scope = "CLOUDFRONT"
  ip_address_version = "IPV6"
  addresses = var.ipv6address
}