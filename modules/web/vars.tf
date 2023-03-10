variable "ami" {
  default = "ami-0055e70f580e9ae80"
}

variable "key_name" {
  description = "SSH Key used for the servers."
}

variable "subnet_id" {
  description = "Subnet ID information for the Web servers."
}

variable "subnet_weba" {
  description = "Subnet ID information for EU-WEST-2A AZ"
}

variable "subnet_webb" {
  description = "Subnet ID information for EU-WEST-2B AZ"
}

variable "vpc_id" {
  description = "VPC ID information for TF servers."
}

variable "instance_type" {
  description = ""
}

variable "min_size" {
  description = ""
}

variable "max_size" {
  description = ""
}

variable "desired_capacity" {
  description = ""
}