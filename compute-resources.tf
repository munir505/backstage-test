#Creating instance
resource "google_compute_instance" "my_instance" {
  project = var.project_id
  name         = var.name
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20240228"
    }
  }

  network_interface{
    network = default
  #  subnetwork =
  }
  
  
  # Attach service account to resource
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  =  var.service_account
    scopes = ["cloud-platform"]


  }
  allow_stopping_for_update = true
}