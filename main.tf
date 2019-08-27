provider "google" {
  credentials = file("gcp-key.json")
  project     = var.project_id
  region      = "us-east1"
  zone        = "us-east1-b"
  version     = "~> 2.12"
}

resource "google_compute_instance" "gcpte_vm" {
  name         = "gcpte-vm"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = google_compute_network.gcpte_vpc.self_link
    access_config {
    }
  }
}

resource "google_compute_network" "gcpte_vpc" {
  name                    = "gcpte-vpc"
  auto_create_subnetworks = "true"
}

resource "google_compute_subnetwork" "gcpte_subnet" {
  name          = "gcpte-subnet"
  ip_cidr_range = "10.96.0.0/14"
  network       = google_compute_network.gcpte_vpc.self_link
}
