variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = "string"
}

provider "aws" {
  region = "us-west-2"
}


