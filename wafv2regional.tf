resource "aws_wafv2_web_acl" "WafV2RegionalWebAcl" {
    name        = "Cloudflare_Regional_WebAcl"
    description = "Permits only Cloudflare IPs"
    scope       = "REGIONAL"

    default_action {
        block {}
    }
    
    visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name = "Cloudfalre_WebAcl_Metric"
        sampled_requests_enabled   = true
    }

    rule {
        name     = "Cloudflare_IPv4_Rule"
        priority = 0

        action {
            allow {}
        }

        statement {
            ip_set_reference_statement {
                arn = aws_wafv2_ip_set.IPv4RegionCloudflareIPSet.arn
            }
        }

        visibility_config {
            cloudwatch_metrics_enabled = true
            metric_name                = "Cloudflare_IPv4_Rule_Metric"
            sampled_requests_enabled   = true
        }
    }

    rule {
        name     = "Cloudflare_IPv6_Rule"
        priority = 1

        action {
            allow {}
        }

        statement {
            ip_set_reference_statement {
                arn = aws_wafv2_ip_set.IPv6RegionCloudflareIPSet.arn
            }
        }

        visibility_config {
            cloudwatch_metrics_enabled = true
            metric_name                = "Cloudflare_IPv6_Rule_Metric"
            sampled_requests_enabled   = true
        }
    }

}

resource "aws_wafv2_web_acl_logging_configuration" "WafV2WebAclRegionalLogging" {
    log_destination_configs = [aws_kinesis_firehose_delivery_stream.KinesisFirehoseDeliveryStream.arn]
    resource_arn = aws_wafv2_web_acl.WafV2RegionalWebAcl.arn
}