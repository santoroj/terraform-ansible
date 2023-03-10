variable "region" {
  description = "Region where the servcies needed to be hosted."
  default     = "eu-west-2"
}

variable "key_name" {
  description = "ssh key."
  default     = "joes-saa03"
}

variable "instance_type" {
  description = "instance type."
  default     = "t2.micro"
}

variable "min_size" {
  description = "min size of instances"
  default     = "1"
}

variable "max_size" {
  description = "min size of instances"
  default     = "2"
}

variable "desired_capacity" {
  description = "desired capacity of instances"
  default     = "2"
}