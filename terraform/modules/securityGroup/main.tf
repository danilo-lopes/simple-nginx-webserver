resource "aws_security_group" "webserverSecurityGroup" {
  name = "webserverSecurityGroup"
  description = "Seucurity Group WebServer"
  vpc_id = var.vpcID

  tags = {
    Name = "webserverSecurityGroup"
  }

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}