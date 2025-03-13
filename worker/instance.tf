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
    user_data = base64encode(templatefile("${path.module}/cloudinit/worker.tftpl", {
      hostname           = lower(var.display_name)
      tailscale_auth_key = var.tailscale_auth_key
      bootstrap_token    = var.bootstrap_token
      ca_cert_hash       = var.ca_cert_hash
      master_ip          = var.master_ip
    }))
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = var.ssh_private_key
  }

  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait > /dev/null"
    ]
  }
}
