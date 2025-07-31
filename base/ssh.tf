resource "tls_private_key" "dev_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "epam-tf-ssh-key"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
    command = "export TF_VAR_ssh_key='${tls_private_key.pk.public_key_openssh}'"
  }
}
