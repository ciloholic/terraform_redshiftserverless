data "aws_region" "current" {}

variable "service_name" {
  type    = string
  default = "ciloholic"
}
variable "env" {
  type    = string
  default = "dev"
}

locals {
  service_config = {
    name   = var.service_name
    env    = var.env
    prefix = "${var.service_name}-${var.env}"
  }
  aws_config = {
    region = data.aws_region.current.name
  }
  network_config = {
    vpc = {
      cidr_block = "10.0.0.0/16"
    }
    availability_zones = ["a", "c", "d"]
    subnet = {
      "storage" = {
        "a" = "10.0.1.0/24"
        "c" = "10.0.2.0/24"
        "d" = "10.0.3.0/24"
      }
    }
  }
}
