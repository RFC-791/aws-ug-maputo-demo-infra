resource "aws_flow_log" "flow_logs" {
  iam_role_arn    = aws_iam_role.flow_logs.arn
  log_destination = aws_cloudwatch_log_group.log.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.pvt.id
}

resource "aws_cloudwatch_log_group" "logs" {
  name = "aws-ug-maputo-flow-logs"
}

data "aws_iam_policy_document" "logs_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "flow_logs" {
  name               = "aws-ug-maputo-flow-log-role"
  assume_role_policy = data.aws_iam_policy_document.logs_assume_role.json
}

data "aws_iam_policy_document" "log_policy" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "flow_logs_role_policy" {
  name   = "aws-ug-maputo-flow-logs-role-policy"
  role   = aws_iam_role.example.id
  policy = data.aws_iam_policy_document.log_policy.json
}

