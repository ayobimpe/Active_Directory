resource "aws_iam_role" "AWS-NetworkOpsAdmin2" {
    name = "AWS-NetworkOpsAdmin2"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Federated": "${aws_iam_saml_provider.idp.arn}"
      },
      "Action": "sts:AssumeRoleWithSAML",
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "AWS-NetworkOpsAdmin2" {
  role       = aws_iam_role.AWS-NetworkOpsAdmin2.name
  policy_arn = "arn:aws-us-gov:iam::aws:policy/AdministratorAccess"
}


resource "aws_iam_role" "AWS-TorchDeveloper2" {
    name = "AWS-TorchDeveloper2"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Federated": "${aws_iam_saml_provider.idp.arn}"
      },
      "Action": "sts:AssumeRoleWithSAML",
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "AWS-TorchDeveloper2" {
  role       = aws_iam_role.AWS-TorchDeveloper2.name
  policy_arn = "arn:aws-us-gov:iam::aws:policy/ReadOnlyAccess"
}



resource "aws_iam_role" "AWS-TorchTeamLead2" {
    name = "AWS-TorchTeamLead2"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Federated": "${aws_iam_saml_provider.idp.arn}"
      },
      "Action": "sts:AssumeRoleWithSAML",
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "AWS-TorchTeamLead2" {
  role       = aws_iam_role.AWS-TorchTeamLead2.name
  policy_arn = "arn:aws-us-gov:iam::aws:policy/PowerUserAccess"
}


# Create IAM Role Policy
resource "aws_iam_role_policy" "Allow_access_key_creation" {
  name = "Allow_access_key_creation"
  role = aws_iam_role.AWS-TorchTeamLead2.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "iam:*AccessKey*",
        "iam:CreateAccessKey",
        "iam:ChangePassword",
        "iam:GetUser",
        "iam:*ServiceSpecificCredential*",
        "iam:*SigningCertificate*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "iam:ListUsers",
        "iam:GetAccountPasswordPolicy"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}