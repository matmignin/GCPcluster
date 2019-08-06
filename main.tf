provider "google" {
  project = "var.project_id"
  region  = "us-east1"
  zone    = "us-east1-b"
}



resource "google_compute_instance" "admin_vm" {
  name         = "gcp-admin"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    netowrk = "google_compute_network.gcp_demo_vpc.self_link"
    access_config {
    }
  }
}
