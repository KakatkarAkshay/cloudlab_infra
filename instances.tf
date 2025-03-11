resource "oci_core_instance" "karken" {
  availability_domain = local.availability_domain
  compartment_id      = var.oci_compartment
  display_name        = "Kraken"
  shape               = var.oci_instance_shape

  shape_config {
    ocpus         = var.oci_instance_opus
    memory_in_gbs = var.oci_instance_memory_in_gb
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.cloudlab_subnet.id
    display_name     = "Kraken VNIC"
    assign_public_ip = true
    assign_ipv6ip    = true
  }

  source_details {
    boot_volume_size_in_gbs = var.oci_boot_volume_size_in_gb
    boot_volume_vpus_per_gb = var.oci_boot_volume_vpus_per_gb
    source_type             = "image"
    source_id               = local.ubuntu_24_04_minimal_aarch64_image_id
  }

  metadata = {
    ssh_authorized_keys = local.ssh_keys
    user_data = base64encode(templatefile("cloudinit/tailnet.tftpl", {
      hostname           = "kraken",
      tailscale_auth_key = tailscale_tailnet_key.tailscale_auth_key.key
    }))
  }
}

resource "oci_core_instance" "vortex" {
  availability_domain = local.availability_domain
  compartment_id      = var.oci_compartment
  display_name        = "Vortex"
  shape               = var.oci_instance_shape

  shape_config {
    ocpus         = var.oci_instance_opus
    memory_in_gbs = var.oci_instance_memory_in_gb
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.cloudlab_subnet.id
    display_name     = "Vortex VNIC"
    assign_public_ip = true
    assign_ipv6ip    = true
  }

  source_details {
    boot_volume_size_in_gbs = var.oci_boot_volume_size_in_gb
    boot_volume_vpus_per_gb = var.oci_boot_volume_vpus_per_gb
    source_type             = "image"
    source_id               = local.ubuntu_24_04_minimal_aarch64_image_id
  }

  metadata = {
    ssh_authorized_keys = local.ssh_keys
    user_data = base64encode(templatefile("cloudinit/tailnet.tftpl", {
      hostname           = "vortex"
      tailscale_auth_key = tailscale_tailnet_key.tailscale_auth_key.key
    }))
  }
}
