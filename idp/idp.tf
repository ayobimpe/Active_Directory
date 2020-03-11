provider "aws" {
  region = var.region
}


resource "aws_iam_saml_provider" "idp" {
  name                   = var.provider_name
  saml_metadata_document = file("FederationMetadata---sandbox.xml")
}

