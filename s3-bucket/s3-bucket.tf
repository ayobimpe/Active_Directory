#Create S3 Bucket for BRM database backup
resource "aws_s3_bucket" "statebackend" {
  bucket = "statebackend"
  acl    = var.acl
  region = var.region
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.awsgss_kms
        sse_algorithm     = "aws:kms"
      }
    }
    depends_on = [var.awsgss_kms]
  }

  tags = {
    Name        = "state_bucket"
    Environment = "user-directory"
  }
}