data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_launch_template" "app" {
  name_prefix   = "laravel-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  key_name = "laravel-key"

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [
      aws_security_group.app.id
    ]
  }
}