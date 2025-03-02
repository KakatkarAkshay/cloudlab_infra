resource "oci_core_instance" "karken" {
    availability_domain = data.oci_identity_availability_domain.ad.name
    compartment_id = var.oci_compartment
    display_name = "Kraken"
    shape = var.oci_instance_shape

    shape_config {
      ocpus = var.oci_instance_opus
      memory_in_gbs = var.oci_instance_memory_in_gb
    }

    create_vnic_details {
      subnet_id = oci_core_subnet.scorpion_subnet.id
      display_name = "Kraken VNIC"
      assign_public_ip = true
      assign_ipv6ip = true
      hostname_label = "kraken"
    }

    source_details {
        boot_volume_size_in_gbs = var.oci_boot_volume_size_in_gb
        boot_volume_vpus_per_gb = var.oci_boot_volume_vpus_per_gb
        source_type = "image"
        source_id = lookup(data.oci_core_images.ubuntu_24_04_minimal_aarch64.images[0], "id")
    }

    metadata = {
      ssh_authorized_keys = var.ssh_public_key
    }
}

resource "oci_core_instance" "vortex" {
    availability_domain = data.oci_identity_availability_domain.ad.name
    compartment_id = var.oci_compartment
    display_name = "Vortex"
    shape = var.oci_instance_shape

    shape_config {
      ocpus = var.oci_instance_opus
      memory_in_gbs = var.oci_instance_memory_in_gb
    }

    create_vnic_details {
      subnet_id = oci_core_subnet.scorpion_subnet.id
      display_name = "Vortex VNIC"
      assign_public_ip = true
      assign_ipv6ip = true
      hostname_label = "vortex"
    }

    source_details {
        boot_volume_size_in_gbs = var.oci_boot_volume_size_in_gb
        boot_volume_vpus_per_gb = var.oci_boot_volume_vpus_per_gb
        source_type = "image"
        source_id = lookup(data.oci_core_images.ubuntu_24_04_minimal_aarch64.images[0], "id")
    }

    metadata = {
      ssh_authorized_keys = var.ssh_public_key
    }
}

resource "oci_core_instance" "aetheron" {
    availability_domain = data.oci_identity_availability_domain.ad.name
    compartment_id = var.oci_compartment
    display_name = "Aetheron"
    shape = var.oci_instance_shape

    shape_config {
      ocpus = var.oci_instance_opus
      memory_in_gbs = var.oci_instance_memory_in_gb
    }

    create_vnic_details {
      subnet_id = oci_core_subnet.scorpion_subnet.id
      display_name = "Aetheron VNIC"
      assign_public_ip = true
      assign_ipv6ip = true
      hostname_label = "aetheron"
    }

    source_details {
        boot_volume_size_in_gbs = var.oci_boot_volume_size_in_gb
        boot_volume_vpus_per_gb = var.oci_boot_volume_vpus_per_gb
        source_type = "image"
        source_id = lookup(data.oci_core_images.ubuntu_24_04_minimal_aarch64.images[0], "id")
    }

    metadata = {
      ssh_authorized_keys = var.ssh_public_key
    }
}

resource "oci_core_instance" "drakon" {
    availability_domain = data.oci_identity_availability_domain.ad.name
    compartment_id = var.oci_compartment
    display_name = "Drakon"
    shape = var.oci_instance_shape

    shape_config {
      ocpus = var.oci_instance_opus
      memory_in_gbs = var.oci_instance_memory_in_gb
    }

    create_vnic_details {
      subnet_id = oci_core_subnet.scorpion_subnet.id
      display_name = "Drakon VNIC"
      assign_public_ip = true
      assign_ipv6ip = true
      hostname_label = "drakon"
    }

    source_details {
        boot_volume_size_in_gbs = var.oci_boot_volume_size_in_gb
        boot_volume_vpus_per_gb = var.oci_boot_volume_vpus_per_gb
        source_type = "image"
        source_id = lookup(data.oci_core_images.ubuntu_24_04_minimal_aarch64.images[0], "id")
    }

    metadata = {
      ssh_authorized_keys = var.ssh_public_key
    }
}