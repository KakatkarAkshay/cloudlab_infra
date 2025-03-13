resource "random_password" "hostname_suffix" {
  length  = 6
  special = false
  lower   = true
  upper   = false
  numeric = false
}

data "tailscale_device" "instance_device" {
  name     = lower("${var.display_name}-${random_password.hostname_suffix.result}.${var.tailnet_dns_name}")
  wait_for = "60s"

  depends_on = [oci_core_instance.instance]
}

output "tailscale_ipv4_address" {
  value = data.tailscale_device.instance_device.addresses[0]
}
