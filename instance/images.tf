data "oci_core_images" "ubuntu" {
  compartment_id           = var.oci_compartment
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "24.04"
  shape                    = var.oci_instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

locals {
  ubuntu_image_id = data.oci_core_images.ubuntu.images[0].id
}
