provider "scaleway" {
  zone            = "fr-par-1"
  region          = "fr-par"
}

resource "scaleway_k8s_cluster" "matrix-infra" {
  name             = "matrix-infra"
  version          = "1.20.5"
  cni              = "cilium"
}

resource "scaleway_k8s_pool" "matrix" {
  cluster_id  = scaleway_k8s_cluster.matrix-infra.id
  name        = "matrix"
  node_type   = "DEV1-M"
  size        = 1
  autohealing = true
  tags        = ["matrix"]
}

resource "scaleway_k8s_pool" "storage" {
  cluster_id  = scaleway_k8s_cluster.matrix-infra.id
  name        = "storage"
  node_type   = "DEV1-M"
  size        = 1
  autohealing = true
  tags        = ["storage"]
}
