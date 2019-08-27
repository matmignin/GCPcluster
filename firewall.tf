resource "google_compute_firewall" "gcpte_external_firewall" {
  name    = "gcpte-external-firewall"
  network = google_compute_network.gcpte_vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

}


resource "google_compute_firewall" "gcpte_internal_firewall" {
  name    = "gcpte-internal-firewall"
  network = google_compute_network.gcpte_vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

}
