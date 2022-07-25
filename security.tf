#SECURITY_LIST

resource "oci_core_security_list" "test_security_list" {
    
    compartment_id = var.compartmentA
    vcn_id = oci_core_vcn.test_vcn.id
        display_name = "lista_aulaTerraform"

        egress_security_rules {
        
        destination = "0.0.0.0/0"
        protocol = "all"


                icmp_options {
           
            type = "0"
                        }
                }

                ingress_security_rules {
        
             protocol = "6"
             source = "0.0.0.0/0" 


                icmp_options {
            type = "0"
                        }

            tcp_options {

             max = "22"
             min = "22"
                }
 }
}
