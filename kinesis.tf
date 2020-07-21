resource "aws_cloudwatch_log_group" "CloudWatchLogGroup" {
    name = "/aws/kinesisfirehose/aws-waf-logs-cloudflare"
    retention_in_days = 14
}

resource "aws_cloudwatch_log_stream" "CloudWatchLogStream" {
    name = "S3Delivery"
    log_group_name = aws_cloudwatch_log_group.CloudWatchLogGroup.name
}

resource "aws_kinesis_firehose_delivery_stream" "KinesisFirehoseDeliveryStream" {
    name = "aws-waf-logs-cloudflare"
    destination = "extended_s3"

    extended_s3_configuration {
        role_arn   = aws_iam_role.IamRole.arn
        bucket_arn = var.aws_s3_bucket_arn
        s3_backup_mode = "Disabled"
        compression_format = "UNCOMPRESSED"

        cloudwatch_logging_options {
            enabled = true
            log_group_name = aws_cloudwatch_log_group.CloudWatchLogGroup.name
            log_stream_name = aws_cloudwatch_log_stream.CloudWatchLogStream.name
        }
    }
}