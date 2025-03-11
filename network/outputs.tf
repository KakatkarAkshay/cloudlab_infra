output "vcn_id" {
  value = oci_core_vcn.cloudlab_vcn.id
}

output "subnet_id" {
  value = oci_core_subnet.cloudlab_subnet.id
}

output "security_list_id" {
  value = oci_core_security_list.cloudlab_security_list.id
}

output "route_table_id" {
  value = oci_core_route_table.cloudlab_route_table.id
}

output "igw_id" {
  value = oci_core_internet_gateway.cloudlab_igw.id
}
