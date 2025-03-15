resource "oci_core_instance" "instance" {
  availability_domain = local.availability_domain
  compartment_id      = var.oci_compartment
  display_name        = var.display_name
  shape               = var.oci_instance_shape

  shape_config {
    ocpus         = var.oci_instance_opus
    memory_in_gbs = var.oci_instance_memory_in_gb
  }

  create_vnic_details {
    subnet_id        = var.subnet_id
    display_name     = "${var.display_name} VNIC"
    assign_public_ip = true
    assign_ipv6ip    = true
  }

  source_details {
    boot_volume_size_in_gbs = var.oci_boot_volume_size_in_gb
    boot_volume_vpus_per_gb = var.oci_boot_volume_vpus_per_gb
    source_type             = "image"
    source_id               = local.ubuntu_image_id
  }

  metadata = {
    ssh_authorized_keys = local.ssh_keys
    user_data = base64encode(templatefile("${path.module}/cloudinit/master.tftpl", {
      hostname            = lower(var.display_name)
      tailscale_auth_key  = var.tailscale_auth_key
      ca_cert_pem         = base64encode(tls_self_signed_cert.k8s_ca_cert.cert_pem)
      ca_key_pem          = base64encode(tls_private_key.k8s_ca_key.private_key_pem)
      apiserver_key_pem   = base64encode(tls_private_key.k8s_apiserver_key.private_key_pem)
      client_key_pem      = base64encode(tls_private_key.k8s_client_key.private_key_pem)
      ssh_host_key_pem    = base64encode(tls_private_key.ssh_host_key.private_key_pem)
      ssh_host_pubkey_pem = tls_private_key.ssh_host_key.public_key_openssh
      bootstrap_token     = local.bootstrap_token
      certificate_key     = local.certificate_key
      advertise_routes    = join(",", var.advertise_routes)
    }))
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = tls_private_key.ssh_host_key.private_key_pem
  }

  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait > /dev/null"
    ]
  }
}

output "public_ip" {
  value = oci_core_instance.instance.public_ip
}

output "private_ip" {
  value = oci_core_instance.instance.private_ip
}
