resource "aws_sns_topic" "aulaserverless_topic" {
  name = "${var.service_name}-topic"
}

resource "aws_sns_topic_subscription" "lambda" {
  topic_arn = aws_sns_topic.aulaserverless_topic.arn
  protocol  = "lambda"
  endpoint  = var.lambda_fuction_arn
}