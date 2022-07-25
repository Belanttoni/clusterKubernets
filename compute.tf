#INSTANCIA

resource "oci_core_instance" "test_instance" {
    
          availability_domain = "Osan:US-ASHBURN-AD-2"
          compartment_id = var.compartmentA
          shape = "VM.Standard.A1.Flex"
          display_name = "Server_aulaTerraform"

#IMAGE
    shape_config {

        #Optional
        
          memory_in_gbs = "6"
          ocpus = "1"
    }

        source_details {        
          source_id = "ocid1.image.oc1.iad.aaaaaaaa5wnp5fmk6fvzvzt7dmsgrixdhig7i7ce2zhsuekhv7njfmxcmuvq"
          source_type = "image"
        }
#VNIC
        create_vnic_details {
          subnet_id = oci_core_subnet.test_subnet.id
    }
}
