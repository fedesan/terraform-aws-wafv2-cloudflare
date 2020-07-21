resource "aws_iam_role" "IamRole" {
    name = "iam_role_firehose_waf"
    path = "/"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "firehose.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "IamRolePolicy" {
    name = "iam_role_policy_kinesis_waf"
    role = aws_iam_role.IamRole.id

    policy = <<-EOF
{
   "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "ec2:Describe*",
                "firehose:DeleteDeliveryStream",
                "firehose:PutRecord",
                "firehose:PutRecordBatch",
                "firehose:UpdateDestination",
                "s3:*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "IamInstanceProfile" {
    name = "iam_instance_profile_kinesis_waf"
    role = aws_iam_role.IamRole.name
}
