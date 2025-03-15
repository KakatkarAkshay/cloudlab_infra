resource "oci_identity_policy" "requestor_policy" {
  name           = "Local_Peering_Policy"
  description    = "Local_Peering_Policy"
  compartment_id = var.oci_tenancy_1
  statements = ["Define tenancy Acceptor as ${var.oci_tenancy_2}",
    "Endorse group Administrators to manage local-peering-to in tenancy Acceptor",
    "Endorse group Administrators to associate local-peering-gateways in tenancy with local-peering-gateways in tenancy Acceptor",
    "Allow group Administrators to manage local-peering-from in tenancy"
  ]

  provider = oci.tenancy_1
}

resource "oci_identity_policy" "acceptor_policy" {
  name           = "Local_Peering_Policy"
  description    = "Local_Peering_Policy"
  compartment_id = var.oci_tenancy_2
  statements = ["Define tenancy Requestor as ${var.oci_tenancy_1}",
    "Define group RequestorGrp as ${var.oci_requestor_group}",
    "Allow group Administrators to manage local-peering-from in tenancy",
    "Admit group RequestorGrp of tenancy Requestor to manage local-peering-to in tenancy",
    "Admit group RequestorGrp of tenancy Requestor to associate local-peering-gateways in tenancy Requestor with local-peering-gateways in tenancy"
  ]

  provider = oci.tenancy_2
}
