output "instance_public_dns" {
  value = "${aws_instance.instance.public_dns}"
}

output "instance_id" {
  value = "${aws_instance.instance.id}"
}

output "ubuntu_ami_id" {
  value = "${data.aws_ami.ubuntu-xenial.image_id}"
}

output "key_pair_name" {
  value = "${aws_key_pair.instance-key-pair.key_name}"
}

output "security_group_id" {
  value = "${aws_security_group.instance-security-group.id}"
}
