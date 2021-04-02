terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "rclb-dev"

    workspaces {
      name = "matrix-infra"
    }
  }
}

module "kapsule" {
  source = "./kapsule"
}

