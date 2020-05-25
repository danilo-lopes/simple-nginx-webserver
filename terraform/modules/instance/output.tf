output "instancePublicIP" {
  value = aws_instance.webserver.public_ip
}