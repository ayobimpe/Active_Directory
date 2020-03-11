# Create SSM Document to install and configure ADFS
resource "aws_ssm_document" "adfs-config" {
  name          = "adfs-config"
  document_type = "Command"

  content = <<DOC
  {
      "schemaVersion":"2.0",
      "description":"Run a PowerShell script to install and configure ADFS",
      "mainSteps":[
         {
            "action":"aws:runPowerShellScript",
            "name":"runPowerShell",
            "inputs":{
               "runCommand":[
                  "Install-WindowsFeature AD-Domain-Services -IncludeManagementTools\n",
                  "$cmdOutput = (New-Guid).Guid\n",
                  "New-ADObject -Name "ADFS" -Type Container -Path “OU=awsgss,DC=gss,DC=com\n",
                  "New-ADObject -Name $cmdOutput -Type Container -Path “CN=ADFS,OU=awsgss,DC=awsgss,DC=com\n",
                  "Install-WindowsFeature ADFS-Federation"\n",
                  "$username = "var.domain_name\n",
                  "$password = "var.admin_password\n",
                  "$svcCred = New-Object System.Management.Automation.PSCredential($username,$password)\n",
                  "$localAdminCred = New-Object System.Management.Automation.PSCredential($username,$password)\n",
                  "$fqdn = "hud.adfs.pyramidlabs.us"\n",
                  "$certThumbprint = "6d6ee286827bf9e34447e6a1908e45198f66a3cf"\n",
                  "$adminConfig = @{"DKMContainerDn"="CN=$cmdOutput,CN=ADFS,OU=awsgss,DC=awsgss,DC=com"}"\n",
                  "Install-ADFSFarm -CertificateThumbprint $certThumbprint -FederationServiceName $fqdn -ServiceAccountCredential $svcCred -Credential $localAdminCred -OverwriteConfiguration -AdminConfiguration $adminConfig -SigningCertificateThumbprint $certThumbprint -DecryptionCertificateThumbprint $certThumbprint"\n",
                  "Set-ADFSProperties -EnableIdpInitiatedSignonPage $true"
               ]
            }
         }
      ]
   }
DOC
}
