variable "subnets_private" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

}

variable "subnets_public" {
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "azs" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}


variable "eks_name" {
  description = "Eks cluster name"
  type        = string
  default     = "aula-eks"
}
