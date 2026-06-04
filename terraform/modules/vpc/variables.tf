
variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "Public Subnet A CIDR"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "Public Subnet B CIDR"
  type        = string
}

variable "private_subnet_1_cidr" {
  description = "Private Subnet A CIDR"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "Private Subnet B CIDR"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}