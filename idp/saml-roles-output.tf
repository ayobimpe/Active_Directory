
output "AWS-TorchDeveloper_role_arn" {
  value = aws_iam_role.AWS-TorchDeveloper2.arn
  description = "Developer role ARN"
}

output "AWS-NetworkOpsAdmin_role_arn" {
  value = aws_iam_role.AWS-NetworkOpsAdmin2.arn
  description = "Administrator role ARN"
}

output "AWS-TorchTeamLead_role_arn" {
  value = aws_iam_role.AWS-TorchTeamLead2.arn
  description = "Teamlead role ARN"
}