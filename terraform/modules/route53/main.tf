resource "aws_route53_record" "siteBiqueirabr" {
  name = "site.biqueirabr.com.br"
  type = "A"
  zone_id = var.hostedDnsZoneID
  ttl = "300"

  records = [var.ec2PublicIP]
}

resource "aws_route53_record" "lojaBiqueirabr" {
  name = "loja.biqueirabr.com.br"
  type = "A"
  zone_id = var.hostedDnsZoneID
  ttl = "300"

  records = [var.ec2PublicIP]
}

resource "aws_route53_record" "blogBiqueirabr" {
  name = "blog.biqueirabr.com.br"
  type = "A"
  zone_id = var.hostedDnsZoneID
  ttl = "300"

  records = [var.ec2PublicIP]
}

resource "aws_route53_record" "tomcatBiqueirabr" {
  name = "tomcat.biqueirabr.com.br"
  type = "A"
  zone_id = var.hostedDnsZoneID
  ttl = "300"

  records = [var.ec2PublicIP]
}

locals {
  dnsRecords = {
    "siteBiqueirabr": aws_route53_record.siteBiqueirabr.name,
    "blogBiqueirabr": aws_route53_record.blogBiqueirabr.name,
    "lojaBiqueirabr": aws_route53_record.lojaBiqueirabr.name,
    "tomcatBiqueirabr": aws_route53_record.tomcatBiqueirabr.name,
  }
}