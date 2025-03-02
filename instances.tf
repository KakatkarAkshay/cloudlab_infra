resource "oci_core_instance" "karken" {
    availability_domain = data.oci_identity_availability_domain.ad.ad_number
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
      hostname_label = "kraken"
    }

    source_details {
      source_type = "image"
      source_id = data.oci_core_images.ubuntu_24_04_minimal_aarch64.id
    }
}