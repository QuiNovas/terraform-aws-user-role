output "arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = aws_iam_role.role.arn
}

output "unique_id" {
  description = "The stable and unique string identifying the role."
  value       = aws_iam_role.role.unique_id
}

