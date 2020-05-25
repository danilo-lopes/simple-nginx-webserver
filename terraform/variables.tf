variable "vpcID" {
  description = "VPC ID"
  default = "vpc-2699be5c"
}

variable "subnetID" {
  description = "Subnet ID"
  default = "subnet-f3e0f1dd"
}

variable "insanceAmi" {
  description = "AMI used"
  default = "ami-0015b9ef68c77328d" # CentOS 7
}

variable "hostedDnsZoneID" {
  description = "biqueirabr route53 zone ID"
  default = "Z0961408LJOE4H2MBYPK"
}

variable "sshKeyName" {
  description = "SSH Key pair from EC2 Console"
  default = "ec2"
}

variable "sshKeyPath" {
  description = "Path of yours SSH key pair"
  default = "/home/danilo/.ssh/ec2.pem"
}

variable "instanceShape" {
  description = "Shape of Instance"
  default = "t2.micro"
}
