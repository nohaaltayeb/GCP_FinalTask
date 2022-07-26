resource "google_compute_instance" "private-vm" {
  name         = "private-vm"
  machine_type = "e2-micro"
  zone         = "${google_compute_subnetwork.managment-subnet.region}-a"
  allow_stopping_for_update = true
  service_account {
    email = google_service_account.service_account.email
    scopes = [ "cloud-platform" ]

  }
  depends_on = [
   google_compute_network.vpc_network,
    google_compute_firewall.allow-ssh
  ]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      type = "pd-standard"
      size = 10
    }
  }


  network_interface {
    network =google_compute_network.vpc_network.name
    subnetwork =google_compute_subnetwork.managment-subnet.name
  }
}