resource "google_compute_instance" "test-workflow" {
  name         = "test-workflow"
  zone         = "europe-west2-c"
  machine_type = "n1-standard-2"

  network_interface {
    subnetwork = "projects/coen-munir-kakar/regions/europe-west2/subnetworks/test-subnet"
  }

  boot_disk {
    auto_delete = "false"
    source      = google_compute_disk.workflow-test-disk.self_link
  }
}

resource "google_compute_disk" "workflow-test-disk" {
  name  = "workflow-test-disk"
  type  = "pd-ssd"
  zone  = "europe-west2-c"
  size  = 100
  image = "ubuntu-2004-focal-v20240125"
}
