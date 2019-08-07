provider "google" {
  project = var.project_id
  region  = "us-east1"
  zone    = "us-east1-b"
}

resource "google_compute_instance" "admin_vm" {
  name         = "admin-vm"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network"
  auto_create_subnetworks = "true"
}

