resource "aws_lb" "app" {
  name               = "laravel-alb"
  load_balancer_type = "application"
  internal           = false

  security_groups = [
    aws_security_group.app.id
  ]

  subnets = [
    var.public_subnet_1,
    var.public_subnet_2
  ]
}