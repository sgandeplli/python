resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = var.node_count

  # Enable or disable deletion protection
  deletion_protection = false

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = 30

    # Optional: Add scopes for specific permissions
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  # If using `remove_default_node_pool`, consider setting it to true 
  # and managing node pools explicitly for better control
  remove_default_node_pool = false
}
