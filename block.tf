#BLOCKS
resource "oci_core_volume" "test_volume" {
        compartment_id = var.compartmentA
        size_in_gbs = 50
        display_name = "block_aulaTerraform"
        availability_domain = "Osan:US-ASHBURN-AD-2"
}

resource "oci_core_volume_attachment" "test_volume_attachment" {
        attachment_type = "iscsi"
        instance_id = oci_core_instance.test_instance.id
        volume_id = oci_core_volume.test_volume.id
}
