terraform {
  backend "s3" {
    bucket = "terrbac"
    key    = "gss/statefile"
    region = "us-east-1"
        }
      }
