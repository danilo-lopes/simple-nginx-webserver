resource "aws_instance" "webserver" {
  ami = var.insanceAmi
  instance_type = var.instanceShape
  subnet_id = var.subnetID
  key_name = var.sshKeyName

  security_groups = [var.securityGroupID]

  tags = {
    Name = "webserver"
  }
}

resource "null_resource" "ConfigureMachine" {
  connection {
    type = "ssh"
    host = aws_instance.webserver.public_ip
    private_key = file(var.sshKeyPath)
    user = "centos"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/installationPackages.sh"
    destination = "/tmp/installationPackages.sh"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/playbook.yaml"
    destination = "/tmp/playbook.yaml"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/settingsFiles/tomcat.service"
    destination = "/tmp/tomcat.service"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/settingsFiles/site.conf"
    destination = "/tmp/site.conf"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/settingsFiles/loja.conf"
    destination = "/tmp/loja.conf"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/settingsFiles/blog.conf"
    destination = "/tmp/blog.conf"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/settingsFiles/nginx.conf"
    destination = "/tmp/nginx.conf"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/settingsFiles/wp-config.php"
    destination = "/tmp/wp-config.php"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/settingsFiles/sitebiqueirabr.conf"
    destination = "/tmp/sitebiqueirabr.conf"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/settingsFiles/blogbiqueirabr.conf"
    destination = "/tmp/blogbiqueirabr.conf"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/settingsFiles/lojabiqueirabr.conf"
    destination = "/tmp/lojabiqueirabr.conf"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/settingsFiles/tomcat-reverseProxy.conf"
    destination = "/tmp/tomcat-reverseProxy.conf"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/settingsFiles/index-site.php"
    destination = "/tmp/index-site.php"
  }

  provisioner "file" {
    source = "./modules/instance/playbooks/settingsFiles/index-loja.php"
    destination = "/tmp/index-loja.php"
  }

  provisioner "remote-exec" {
    inline = [
      "bash /tmp/installationPackages.sh",
      "ansible-playbook /tmp/playbook.yaml"
    ]
  }
}
