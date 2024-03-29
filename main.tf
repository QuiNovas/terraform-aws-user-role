data "aws_iam_policy_document" "role" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    
    dynamic "condition" {
      for_each = var.enforce_mfa ? ["enforce_mfa"] : []
      content {
        test = "Bool"
        values = [
          "true",
        ]
        variable = "aws:MultiFactorAuthPresent"
      }
    }

    principals {
      identifiers = var.allowed_user_arns
      type        = "AWS"
    }
  }
}

resource "aws_iam_role" "role" {
  assume_role_policy = data.aws_iam_policy_document.role.json
  name               = var.name
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "role" {
  count      = length(var.policy_arns)
  policy_arn = var.policy_arns[count.index]
  role       = aws_iam_role.role.name
}

module "group" {
  name               = var.name
  allowed_user_names = var.allowed_user_names
  role_arns          = [aws_iam_role.role.arn]
  source             = "QuiNovas/assume-role-group/aws"
  version            = "3.0.1"
}