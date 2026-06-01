resource "aws_autoscaling_group" "app" {

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = [
    var.public_subnet_1,
    var.public_subnet_2
  ]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
}