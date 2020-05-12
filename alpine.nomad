job "alpine" {
  datacenters = ["london"]

  group "alloc" {
    restart {
      attempts = 10
      interval = "5m"
      delay    = "25s"
      mode     = "delay"
    }

    volume "alpine" {
      type      = "csi"
      read_only = false
      source    = "75998672"
    }

    task "docker" {
      driver = "docker"

      volume_mount {
        volume      = "alpine"
        destination = "/srv"
        read_only   = false
      }

      config {
        image = "alpine"
        command = "sh"
        args = ["-c","while true; do sleep 10; done"]
      }
    }
  }
}