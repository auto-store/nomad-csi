type = "csi"
id = "7565291015210894915"
name = "nginx"
external_id = "projects/tharris-demo-env/zones/europe-west2-c/disks/nginx"
access_mode = "single-node-writer"
attachment_mode = "block-device"
plugin_id = "gcepd"
mount_options {
   fs_type = "ext4"
   mount_flags = ["rw"]
}