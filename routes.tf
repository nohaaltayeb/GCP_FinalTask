resource "google_compute_router" "router" {
  name    = "my-router"
  region  = google_compute_subnetwork.managment-subnet.id
  network = google_compute_network.vpc_network.id
}