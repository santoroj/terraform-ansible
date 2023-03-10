# Configure the AWS Provider
provider "aws" {
  region = var.region
}

module "web" {
  source = "./modules/web"

  key_name         = var.key_name
  subnet_id        = aws_subnet.tf-web-a.id
  subnet_weba      = aws_subnet.tf-web-a.id
  subnet_webb      = aws_subnet.tf-web-b.id
  vpc_id           = aws_vpc.tf-vpc.id
  instance_type    = var.instance_type
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity
}
