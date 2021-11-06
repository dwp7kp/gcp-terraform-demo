# resource "google_service_account" "default" {
#   account_id   = "service-account-id"
#   display_name = "Service Account"
# }

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  #machine_type = "f1-micro"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      #image = "debian-9"
      image = "centos-8"
    }
  }

  network_interface {
    network = "default"
    #network = google_compute_network.vpc_network.name
    
    access_config {
      // Public IP is assigned automatically
    }
  }

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  # service_account {
  #   # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  #   email  = google_service_account.default.email
  #   scopes = ["cloud-platform"]
  # }

  allow_stopping_for_update = true
}

# resource "google_compute_instance" "vm_instance" {
#   name         = "terraform-instance"
#   machine_type = "f1-micro"

#   tags = ["foo", "bar"]

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-9"
#     }
#   }

#   // Local SSD disk
#   scratch_disk {
#     interface = "SCSI"
#   }

#   network_interface {
#     network = google_compute_network.vpc_network.name

#     access_config {
#       // Ephemeral public IP
#     }
#   }


#   metadata_startup_script = "echo hi > /test.txt"

#   service_account {
#     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
#     email  = google_service_account.default.email
#     scopes = ["cloud-platform"]
#   }
# }