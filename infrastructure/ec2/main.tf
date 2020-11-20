provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "project_vm" {
  ami = "ami-0dc8d444ee2a42d8a"
  instance_type = "t2.micro"
  key_name = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [var.instance_sg_id]
  subnet_id = var.instance_sn_id
  associate_public_ip_address = var.public_ip_association
}

resource "aws_key_pair" "key_pair" {
  key_name = "project-key"
  public_key = var.pub_key_path
}