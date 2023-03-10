# Create Autolaunch configuration
resource "aws_launch_configuration" "al-tf-web" {
  name            = "al-tf-web"
  instance_type   = var.instance_type
  image_id        = var.ami
  security_groups = ["${aws_security_group.test-web.id}"]
  key_name        = var.key_name
  user_data       = data.template_file.installnginx.rendered
  iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"


  lifecycle {
    create_before_destroy = true
  }

}

# Create AutoScaling group
resource "aws_autoscaling_group" "as-tf-web" {
  name                 = "as-tf-web"
  launch_configuration = aws_launch_configuration.al-tf-web.name
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  target_group_arns    = ["${aws_lb_target_group.tf-tg.arn}"]
  vpc_zone_identifier  = ["${var.subnet_weba}", "${var.subnet_webb}"]

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "CR"
    value               = "SHUTDOWN"
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "TF-Web"
    propagate_at_launch = true
  }

}


data "template_file" "installnginx" {
  template = file("${path.module}/installnginx.tpl")
}
