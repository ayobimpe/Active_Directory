provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}


resource "acme_registration" "adfs_reg" {
  account_key_pem = "${tls_private_key.adfs.private_key_pem}"
  email_address   = "hud-t2fm-aws@pyramidsystems.com"
  depends_on      = ["tls_private_key.adfs"]
}

resource "acme_certificate" "adfs_certificate" {
  account_key_pem           = "${acme_registration.adfs_reg.account_key_pem}"
  common_name               = "hud.adfs.pyramidlabs.us"
 # subject_alternative_names = ["www2.example.com"]

  dns_challenge {
    provider = "route53"

    config = {
        AWS_ACCESS_KEY_ID_FILE     = "/c/Users/aamusa/access_key.txt"
        AWS_SECRET_ACCESS_KEY_FILE = "/c/Users/aamusa/secret_key.txt"
        AWS_DEFAULT_REGION         = "us-gov-west"
    }
  }
}
