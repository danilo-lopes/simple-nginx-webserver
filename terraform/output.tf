output "instancePublicIP" {
  value = module.instance.instancePublicIP
}

output "dnsRecords" {
  value = module.route53.dnsRecords
}
