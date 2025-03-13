data "oci_core_images" "ubuntu" {
  compartment_id           = var.oci_compartment
  operating_system         = var.operating_system
  operating_system_version = var.operating_system_version
  shape                    = var.oci_instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

locals {
  ubuntu_image_id = data.oci_core_images.ubuntu.images[0].id
}
