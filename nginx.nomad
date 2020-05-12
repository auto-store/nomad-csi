job "nginx" {
  datacenters = ["london"]
  type = "service"

  group "nginx" {
    count = 1

    volume "nginx" {
      type      = "csi"
      read_only = false
      source    = "75652910"
    }


    task "nginx" {
      driver = "docker"

      volume_mount {
        volume      = "nginx"
        destination = "/etc/nginx/conf.d/default.conf"
        read_only   = false
      }

      config {
        image = "nginx"
        port_map {
          http = 8080
        }
        port_map {
          https = 443
        }
      }
    }
  }
}