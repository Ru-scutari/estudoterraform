## IAM para lambda s3

resource "aws_iam_role" "iam_lambda_s3" {
  name = "${var.service_name}-lambda-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "policy_lambda_s3" {
  name = "${var.service_name}-lambda-policy"
  role = aws_iam_role.iam_lambda_s3.id

}

resource "aws_iam_role_policy_attachment" "lambda_s3-attach" {
  role       = aws_iam_role.iam_lambda_s3.name
  policy_arn = aws_iam_policy.policy_lambda_s3.arn
}

## IAM para lambda dynamo

resource "aws_iam_role" "iam_lambda_dynamo" {
  name = "${var.service_name}-lambda-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "policy_lambda_dynamo" {
  name = "${var.service_name}-lambda-policy"
  role = aws_iam_role.iam_lambda_dynamo.id

}

resource "aws_iam_role_policy_attachment" "lambda_dynamo-attach" {
  role       = aws_iam_role.iam_lambda_dynamo.name
  policy_arn = aws_iam_policy.policy_lambda_dynamo.arn
}

## IAM para Lambda se conectar com s3

data "aws_iam_policy_document" "s3" {
  statement {

    sid = "AllowS3AndSnsActions"

    Effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["s3.amazonasws.com"]
    }

    actions = [
      "s3:*",
      "sns:*",
    ]

    resources = ["*"]
  }
}

## IAM para Lambda se conectar com dynamo

data "aws_iam_policy_document" "dynamo" {
  statement {

    sid = "AllowDynamoPermissions"

    Effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["dynamodb.amazonasws.com"]
    }

    actions = [
      "dynamodb:*"
    ]

    resources = ["*"]
  }
}

## IAM para Lambdas invocarem outras Lambdas

statement {

    sid = "AllowInvokingLambdas"

    Effect = "Allow"    

    actions = ["lambda:InvokeFunction"]

    resources = ["arn:aws:lambda:*:*:function:*"]
  }

  ## IAM para Lambdas criar Grupos de logs no Cloudwatch

statement {

    sid = "AllowCreatingLogGroups"

    Effect = "Allow"    

    actions = ["logs:CreateLogGroup"]

    resources = ["arn:aws:logs:*:*:*"]
  }

  ## IAM para Lambdas escrever logs no  Cloudwatch

statement {

    sid = "AllowWritingLogs"

    Effect = "Allow"    

    actions = [
        "logs:CreateLogStream", 
        "logs:PutLOGEvents",
        ]

    resources = ["arn:aws:logs:*:*:log-group:/aws/lambda/*:*"]
  }