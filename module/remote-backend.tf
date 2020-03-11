  
terraform {
  backend "s3" {
    bucket = "torchadfsstates"
    key    = "awsgss/statefile"
    region = "us-gov-west-1"
        }
      }