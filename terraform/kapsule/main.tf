provider "scaleway" {
  zone            = "fr-par-1"
  region          = "fr-par"
}

resource "scaleway_k8s_cluster" "matrix" {
  name             = "matrix"
  version          = "1.19.7"
  cni              = "cilium"
  enable_dashboard = true
  ingress          = "nginx"
}

resource "scaleway_k8s_pool" "matrix" {
  cluster_id  = scaleway_k8s_pool.matrix.id
  name        = "matrix"
  node_type   = "DEV1-S"
  size        = 2
  min_size    = 1
  max_size    = 3
  autohealing = true
  tags        = ["matrix"]
}

resource "scaleway_k8s_pool" "storage" {
  cluster_id  = scaleway_k8s_pool.matrix.id
  name        = "storage"
  node_type   = "DEV1-S"
  size        = 2
  min_size    = 1
  max_size    = 3
  autohealing = true
  tags        = ["storage"]
}
