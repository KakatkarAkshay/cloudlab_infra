# Infrastructure Setup

## Prerequisites

### IAM Policy Requirements for Multi-Tenancy

When working with 2 tenancies in Oracle Cloud Infrastructure (OCI), you need to manually add the following IAM Policies in both tenancies:

#### In Tenancy 1 (Requestor)

```hcl
Define tenancy Tenancy2 as <tenancy_2_ocid>
Define group Tenancy2Admins as <tenancy_2_admins_group>
Admit group Tenancy2Admins of tenancy Tenancy2 to manage all-resources IN TENANCY
Endorse group Administrators to manage all-resources in tenancy Tenancy2
```

#### In Tenancy 2 (Acceptor)

```hcl
Define tenancy Tenancy1 as <tenancy_1_ocid>
Define group Tenancy1Admins as <tenancy_1_admins_group>
Admit group Tenancy1Admins of tenancy Tenancy1 to manage all-resources IN TENANCY
Endorse group Administrators to manage all-resources in tenancy Tenancy1
```

To add these policies:

1. Log in to the OCI Console
2. Navigate to Identity & Security > Policies
3. Click "Create Policy"
4. Select the appropriate compartment (root compartment)
5. Enter a name (e.g., "Multi-Tenancy_Policy")
6. Add the policy statements as shown above
7. Replace the placeholder values with your actual tenancy OCIDs and admin group names
8. Click "Create"

Note: Make sure to:

- Replace `<tenancy_1_ocid>` and `<tenancy_2_ocid>` with your actual tenancy OCIDs
- Replace `<tenancy_1_admins_group>` and `<tenancy_2_admins_group>` with your actual admin group OCIDs
- Apply the policies in both tenancies to enable cross-tenancy access
