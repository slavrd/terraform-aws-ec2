provider "aws" {
  access_key              = "${var.access_key}"
  secret_key              = "${var.secret_key}"
  shared_credentials_file = "${var.aws_cred_file_path}"
  region                  = "${var.region}"
}

data "aws_ami" "ubuntu-xenial" {
  most_recent = "true"
  owners      = ["099720109477"]

  filter = {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter = {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "instance-key-pair" {
  key_name_prefix = "tf-instance-"
  public_key      = "${file("${var.pub_key_instance_path}")}"
}

resource "aws_security_group" "instance-security-group" {
  name_prefix = "tf-instance-"

  ingress = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress = {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = "true"
  }

  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "instance" {
  ami                    = "${data.aws_ami.ubuntu-xenial.image_id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${aws_key_pair.instance-key-pair.key_name}"
  vpc_security_group_ids = ["${aws_security_group.instance-security-group.id}"]
}
