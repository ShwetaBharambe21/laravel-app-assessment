resource "aws_launch_template" "app" {

  name_prefix = "laravel"

  image_id = "ami-0f58b397bc5c1f2e8"

  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.app.id
  ]
}