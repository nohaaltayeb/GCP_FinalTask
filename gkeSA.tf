
resource "google_service_account" "gke_sa" {
  account_id   = "gke-sa"
  display_name = "GKE Service Account"
  
}


resource "google_project_iam_member" "gke_role" {
  project = "my-project-noha"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.gke_sa.email}"
}

resource "google_project_iam_member" "gke_admin_role" {
  project = "my-project-noha"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gke_sa.email}"
}

