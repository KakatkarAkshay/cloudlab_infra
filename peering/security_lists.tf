resource "oci_core_security_list" "cloudlab_security_list_tenancy_1" {
  compartment_id = var.oci_tenancy_1
  vcn_id         = var.vcn_1_id
  display_name   = "CloudLab Security List"

  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = false
  }

  egress_security_rules {
    destination      = "::/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = false
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

  # Allow inbound ICMP traffic over IPv4
  ingress_security_rules {
    protocol    = "1"
    source      = "0.0.0.0/0"
    description = "Allow ICMP from anywhere (IPv4)"

    icmp_options {
      type = 3
      code = 4
    }
  }

  # Allow inbound ICMP traffic over IPv6
  ingress_security_rules {
    protocol    = "1"
    source      = "::/0"
    description = "Allow ICMP from anywhere (IPv6)"

    icmp_options {
      type = 3
      code = 4
    }
  }

  # Allow all traffic from the VCN to the instances
  ingress_security_rules {
    protocol    = "all"
    source      = var.vcn_1_cidr
    description = "Allow all traffic from the VCN to the instances"
  }

  # Allow all traffic from the VCN to the instances over IPv6
  ingress_security_rules {
    protocol    = "all"
    source      = var.vcn_1_ipv6_cidr
    description = "Allow all traffic from the VCN to the instances over IPv6"
  }

  # Allow all traffic from the VCN to the instances
  ingress_security_rules {
    protocol    = "all"
    source      = var.vcn_2_cidr
    description = "Allow all traffic from the VCN to the instances"
  }

  # Allow all traffic from the VCN to the instances over IPv6
  ingress_security_rules {
    protocol    = "all"
    source      = var.vcn_2_ipv6_cidr
    description = "Allow all traffic from the VCN to the instances over IPv6"
  }

  provider = oci.tenancy_1
}

resource "oci_core_security_list" "cloudlab_security_list_tenancy_2" {
  compartment_id = var.oci_tenancy_2
  vcn_id         = var.vcn_2_id
  display_name   = "CloudLab Security List"

  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = false
  }

  egress_security_rules {
    destination      = "::/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = false
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

  # Allow inbound ICMP traffic over IPv4
  ingress_security_rules {
    protocol    = "1"
    source      = "0.0.0.0/0"
    description = "Allow ICMP from anywhere (IPv4)"

    icmp_options {
      type = 3
      code = 4
    }
  }

  # Allow inbound ICMP traffic over IPv6
  ingress_security_rules {
    protocol    = "1"
    source      = "::/0"
    description = "Allow ICMP from anywhere (IPv6)"

    icmp_options {
      type = 3
      code = 4
    }
  }

  # Allow all traffic from the VCN to the instances
  ingress_security_rules {
    protocol    = "all"
    source      = var.vcn_1_cidr
    description = "Allow all traffic from the VCN to the instances"
  }

  # Allow all traffic from the VCN to the instances over IPv6
  ingress_security_rules {
    protocol    = "all"
    source      = var.vcn_1_ipv6_cidr
    description = "Allow all traffic from the VCN to the instances over IPv6"
  }

  # Allow all traffic from the VCN to the instances
  ingress_security_rules {
    protocol    = "all"
    source      = var.vcn_2_cidr
    description = "Allow all traffic from the VCN to the instances"
  }

  # Allow all traffic from the VCN to the instances over IPv6
  ingress_security_rules {
    protocol    = "all"
    source      = var.vcn_2_ipv6_cidr
    description = "Allow all traffic from the VCN to the instances over IPv6"
  }

  provider = oci.tenancy_2
}
