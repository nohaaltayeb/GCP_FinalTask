resource "google_compute_firewall" "allow-ssh" {
  project     = "my-project-noha"
  name        = "allow-ssh"
  network     =  google_compute_network.vpc_network.id
  direction     = "INGRESS"
  source_ranges =  [ "35.235.240.0/20" ]

  description = "Creates firewall rule targeting tagged instances"
  depends_on = [
    google_compute_network.vpc_network
  ]

  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }

}
