resource "google_container_cluster" "cluster_test" {
  name     = "cluster-test"
  location = "us-east1"

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.gcpte_vpc.name
  subnetwork = google_compute_subnetwork.gcpte_subnet.name

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "gcpte_node_pool" {
  name       = "gcpte-node-pool"
  cluster    = google_container_cluster.cluster_test.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

  }
}

