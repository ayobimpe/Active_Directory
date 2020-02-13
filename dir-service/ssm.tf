resource "aws_ssm_parameter" "ssm_password" {
  name        = "/domain/password"
  description = "Domain password"
  type        = "SecureString"
  value       = var.admin_password
  key_id      = var.awsgss_kms
  overwrite   = true
  depends_on = [var.awsgss_kms]
}

resource "aws_ssm_parameter" "ssm_domain_name" {
  name        = "/domain/name"
  description = "Domain name"
  type        = "SecureString"
  value       = var.domain_name
  key_id      = var.awsgss_kms
  overwrite   = true
  depends_on  = [var.awsgss_kms]
}


resource "aws_ssm_document" "ssm_join_domain_doc" {
name = "ssm_join_domain_doc"
document_type = "Command"
content = <<DOC
{
    "schemaVersion": "1.0",
    "description": "Automatic Domain Join Configuration",
    "runtimeConfig": {
        "aws:domainJoin": {
            "properties": {
                "directoryId": "${aws_directory_service_directory.aws_gss_ad.id}",
                "directoryName": "${var.domain_name}",
                "dnsIpAddresses": ${jsonencode(aws_directory_service_directory.aws_gss_ad.dns_ip_addresses)}
            }
        }
    }
}
DOC
	depends_on = [aws_directory_service_directory.aws_gss_ad]
}


# Associate document to window instance for SSM to automatically run the commands against the instance
resource "aws_ssm_association" "ssm_association_instance" {
	name = aws_ssm_document.ssm_join_domain_doc.name
	instance_id = var.window_instance
	depends_on = [aws_ssm_document.ssm_join_domain_doc, var.window_instance]
}


