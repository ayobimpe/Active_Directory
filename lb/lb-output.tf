output "aws_alb_target_group"{
  value = aws_alb_target_group.targetgrp.arn
}

output "target_group_arn"{
  value = aws_alb_target_group.targetgrp.id
}