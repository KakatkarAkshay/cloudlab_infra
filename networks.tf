resource "oci_core_virtual_network" "scorpion_vcn" {
    compartment_id = var.oci_compartment
    display_name = "Scorpion Cloud Network"
    cidr_block = "10.0.0.0/16"
    dns_label = "scorpion_vcn"
}

resource "oci_core_subnet" "scorpion_subnet" {
  cidr_block = "10.0.1.0/24"
  vcn_id = oci_core_virtual_network.scorpion_vcn.id
  compartment_id = var.oci_compartment
  display_name = "Scorpion Subnet"
  dns_label = "scorpion_subnet"
  security_list_ids = [oci_core_security_list.sl.id]
  route_table_id = oci_core_route_table.rt.id
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_internet_gateway" "igw" {
    compartment_id = var.oci_compartment
    display_name = "Internet Gateway"
    vcn_id = oci_core_virtual_network.scorpion_vcn.id
}

resource "oci_core_route_table" "rt" {
    compartment_id = var.oci_compartment
    vcn_id = oci_core_virtual_network.scorpion_vcn.id
    display_name = "Route Table"

    route_rules {
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      network_entity_id = oci_core_internet_gateway.igw.id
    }

    route_rules {
      destination = "::/0"
      destination_type = "CIDR_BLOCK"
      network_entity_id = oci_core_internet_gateway.igw.id
    }
}

resource "oci_core_security_list" "sl" {
    compartment_id = var.oci_compartment
    vcn_id = oci_core_virtual_network.scorpion_vcn.id
    display_name = "Security List"

    egress_security_rules {
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      protocol = "all"
      stateless = false
    }

    egress_security_rules {
      destination = "::/0"
      destination_type = "CIDR_BLOCK"
      protocol = "all"
      stateless = false
    }

  # Allow inbound SSH traffic over IPv4
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    description = "Allow SSH from anywhere (IPv4)"
    
    tcp_options {
      min = 22
      max = 22
    }
  }
  
  # Allow inbound SSH traffic over IPv6
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "::/0"
    description = "Allow SSH from anywhere (IPv6)"
    
    tcp_options {
      min = 22
      max = 22
    }
  }

  # Allow inbound HTTP traffic over IPv4
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    description = "Allow HTTP from anywhere (IPv4)"
    
    tcp_options {
      min = 80
      max = 80
    }
  }
  
  # Allow inbound HTTP traffic over IPv6
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "::/0"
    description = "Allow HTTP from anywhere (IPv6)"
    
    tcp_options {
      min = 80
      max = 80
    }
  }

  # Allow inbound HTTPS traffic over IPv4
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    description = "Allow HTTPS from anywhere (IPv4)"  
    
    tcp_options {
      min = 443
      max = 443
    }
  }

  # Allow inbound HTTPS traffic over IPv6
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "::/0"
    description = "Allow HTTPS from anywhere (IPv6)"
    
    tcp_options {
      min = 443
      max = 443
    }
  }  
}