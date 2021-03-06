#************************************************************************************
# SET REGION AND SSH KEY FOR EC2 INSTANCES
#************************************************************************************
variable "aws_region" {
  description = "AWS Region for deployment"
  default     = "us-east-1"
}

variable "aws_s3_bucket_arn" {
  description = "AWS Kinesis S3 Bucket ARN"
}

variable "ipv4address" {
    type    = list
    default = [
      "173.245.48.0/20",
      "103.21.244.0/22",
      "103.22.200.0/22",
      "103.31.4.0/22",
      "141.101.64.0/18",
      "108.162.192.0/18",
      "190.93.240.0/20",
      "188.114.96.0/20",
      "197.234.240.0/22",
      "198.41.128.0/17",
      "162.158.0.0/16",
      "162.159.0.0/16",
      "162.158.0.0/16",
      "162.159.0.0/16",
      "172.64.0.0/16",
      "172.65.0.0/16",
      "172.66.0.0/16",
      "172.67.0.0/16",
      "172.68.0.0/16",
      "172.69.0.0/16",
      "172.70.0.0/16",
      "172.71.0.0/16",
      "131.0.72.0/22" 
    ]
}

variable "ipv6address" {
    type    = list
    default = [
      "2400:cb00::/32",
      "2606:4700::/32",
      "2803:f800::/32",
      "2405:b500::/32",
      "2405:8100::/32",
      "2a06:98c0::/32",
      "2a06:98c1::/32",
      "2a06:98c2::/32",
      "2a06:98c3::/32",
      "2a06:98c4::/32",
      "2a06:98c5::/32",
      "2a06:98c6::/32",
      "2a06:98c7::/32",
      "2c0f:f248::/32"
    ]
}