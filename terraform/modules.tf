module "instance" {
  source = "./modules/instance"

  subnetID = var.subnetID
  insanceAmi = var.insanceAmi
  sshKeyName = var.sshKeyName
  sshKeyPath = var.sshKeyPath
  instanceShape = var.instanceShape
  securityGroupID = module.securityGroup.securityGroupID
}

module "securityGroup" {
  source = "./modules/securityGroup"

  vpcID = var.vpcID
}

module "route53" {
  source = "./modules/route53"

  ec2PublicIP = module.instance.instancePublicIP
  hostedDnsZoneID = var.hostedDnsZoneID

}
