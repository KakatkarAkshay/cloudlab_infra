data "http" "ssh_keys" {
  url = "https://github.com/${var.github_username}.keys"
}

# Generate CA certificate for Kubernetes
resource "tls_private_key" "k8s_ca_key" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

# Generate the CA certificate hash
data "external" "ca_cert_hash" {
  program = ["bash", "-c", <<EOT
    echo '{"hash": "'"$(echo "${tls_private_key.k8s_ca_key.public_key_pem}" | openssl pkey -pubin -outform der | openssl dgst -sha256 | cut -d " " -f 2)"'"}' 
  EOT
  ]
}

# Generate the API Server certificate
resource "tls_private_key" "k8s_apiserver_key" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

# Generate client certificates for kubeadm
resource "tls_private_key" "k8s_client_key" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

# Generate SSH host key
resource "tls_private_key" "ssh_host_key" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

# Generate a private key for the certificate
resource "tls_private_key" "certificate_private_key" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

locals {
  ssh_keys        = "${data.http.ssh_keys.response_body}${tls_private_key.ssh_host_key.public_key_openssh}"
  certificate_key = sha256(tls_private_key.certificate_private_key.private_key_pem)
}

output "ssh_private_key" {
  value = tls_private_key.ssh_host_key.private_key_pem
}

output "ssh_public_key" {
  value = tls_private_key.ssh_host_key.public_key_openssh
}

output "client_key_pem" {
  value = tls_private_key.k8s_client_key.private_key_pem
}

output "ca_cert_hash" {
  value = data.external.ca_cert_hash.result.hash
}
