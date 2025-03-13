resource "tls_self_signed_cert" "k8s_ca_cert" {
  private_key_pem = tls_private_key.k8s_ca_key.private_key_pem

  subject {
    common_name  = "kubernetes"
    organization = "Kubernetes"
  }

  validity_period_hours = 87600 # 10 years
  is_ca_certificate     = true

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "cert_signing",
  ]
}

# Generate random values for token and certificate key
locals {
  bootstrap_token = "${random_password.token_first.result}.${random_password.token_second.result}"
}

resource "random_password" "token_first" {
  length  = 6
  special = false
  lower   = true
  upper   = false
  numeric = true
}

resource "random_password" "token_second" {
  length  = 16
  special = false
  lower   = true
  upper   = false
  numeric = true
}

resource "tls_cert_request" "k8s_client_csr" {
  private_key_pem = tls_private_key.k8s_client_key.private_key_pem

  subject {
    common_name  = "kubernetes-admin"
    organization = "system:masters"
  }
}

resource "tls_locally_signed_cert" "k8s_client_cert" {
  cert_request_pem   = tls_cert_request.k8s_client_csr.cert_request_pem
  ca_private_key_pem = tls_private_key.k8s_ca_key.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.k8s_ca_cert.cert_pem

  validity_period_hours = 8760

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "client_auth",
  ]
}

output "client_certificate_pem" {
  value = tls_locally_signed_cert.k8s_client_cert.cert_pem
}

output "certificate_authority_pem" {
  value = tls_self_signed_cert.k8s_ca_cert.cert_pem
}

