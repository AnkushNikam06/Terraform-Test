# 1. Create a EC2 instance
resource "aws_instance" "python-app-instance" {
  ami = var.ami
  instance_type = var.instance_type
  tags = var.common_tags
  security_groups = [aws_security_group.python-app-sg.id]
}

# 2. Create a Security Group
resource "aws_security_group" "python-app-sg" {
  vpc_id = var.vpc_id
  name = "python-app-sg"
  depends_on = [ aws_instance.python-app-instance ]
  ingress = {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_block = var.cidr_block
  }

  egress = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_block = var.cidr_block
  }
}
