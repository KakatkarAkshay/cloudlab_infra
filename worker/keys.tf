data "http" "ssh_keys" {
  url = "https://github.com/${var.github_username}.keys"
}

locals {
  ssh_keys = "${data.http.ssh_keys.response_body}${var.ssh_public_key}"
}
