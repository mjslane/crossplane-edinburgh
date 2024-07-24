terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.59.0"
    }
  }
}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_iam_user" "crossplane-demo-user" {
  name = "crossplane-demo"
}

resource "aws_iam_policy" "crospslane-demo-policy" {
  name = "crossplane-demo-policy"
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "allowsqs",
          "Effect" : "Allow",
          "Action" : [
            "sqs:createqueue",
            "sqs:deletequeue",
            "sqs:*tag*",
            "sqs:getqueue*",
            "sqs:*queueattributes"
          ],
          "Resource" : "*"
        }
      ]
  })
}

resource "aws_iam_user_policy_attachment" "demo-policy-attachment" {
  user = aws_iam_user.crossplane-demo-user.name
  policy_arn = aws_iam_policy.crospslane-demo-policy.arn
}

data "aws_caller_identity" "current" {}

resource "aws_iam_role" "test-role-1" {
  name = "queue-test-role"
  assume_role_policy = jsonencode(
    {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Principal": {
                  "AWS": "arn:aws:iam::${local.account_id}:root"
              },
              "Action": "sts:AssumeRole",
              "Condition": {}
          }
      ]
    }
  )
}

resource "aws_iam_role" "test-role-2" {
  name = "queue-test-role-2"
  assume_role_policy = jsonencode(
    {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Principal": {
                  "AWS": "arn:aws:iam::${local.account_id}:root"
              },
              "Action": "sts:AssumeRole",
              "Condition": {}
          }
      ]
    }
  )
}
