
resource "google_container_cluster" "app_cluster" {
  project  = "my-project-noha" 
  name     = "gke-cluster"
  location = "us-central1-a"

  ip_allocation_policy {

  }
    
 private_cluster_config {
    enable_private_endpoint =false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.1.0/28"
  }

  remove_default_node_pool = true
  initial_node_count = 1

   depends_on = [
    google_compute_network.vpc_network
 ]
}

# Small Linux node pool to run some Linux-only Kubernetes Pods.
resource "google_container_node_pool" "linux_pool" {
  name               = "linux-pool"
  project            = google_container_cluster.app_cluster.project

  cluster            = google_container_cluster.app_cluster.name
  location           = google_container_cluster.app_cluster.location
  
  node_count = 3
  node_config {
    image_type   = "COS_CONTAINERD"
    service_account = google_service_account.gke_sa.email


  }
}



