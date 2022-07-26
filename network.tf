#VCN
resource "oci_core_vcn" "test_vcn" {

compartment_id = "ocid1.compartment.oc1..aaaaaaaaqlnotubnustxhdvvoam3vdh34a6kc76phvm6yurnopntdzszoafa"
cidr_blocks = ["10.0.0.0/16"]
display_name = "vcn_aulaTerraform"
}

#SUBNET
resource "oci_core_subnet" "test_subnet" {
    
    cidr_block = "10.0.1.0/24"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaaqlnotubnustxhdvvoam3vdh34a6kc76phvm6yurnopntdzszoafa"
    vcn_id = oci_core_vcn.test_vcn.id
    display_name = "subnet_aulaTerraform"
    route_table_id = oci_core_route_table.test_route_table.id
}

#GATEWAY
resource "oci_core_internet_gateway" "test_internet_gateway" {

    compartment_id = var.compartmentA
    vcn_id = oci_core_vcn.test_vcn.id
    display_name = "Gateway_aulaTerraform"
}

#ROUTETABLE
resource "oci_core_route_table" "test_route_table" {
   
    compartment_id = var.compartmentA
    vcn_id = oci_core_vcn.test_vcn.id
  
    display_name = "routetable_aulaTerraform"
  
    route_rules {   
             network_entity_id = oci_core_internet_gateway.test_internet_gateway.id
             destination = "0.0.0.0/0"
             }
}
