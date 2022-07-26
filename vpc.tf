resource "google_compute_network" "vpc_network" {
  project                 = "My Project Noha"
  name                    = "vpc-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}
