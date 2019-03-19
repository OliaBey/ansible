provider "aws" {
  region = "us-west-2"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}


resource "aws_instance" "tomcat" {
  ami           = "${var.ami_linux}"
  instance_type = "t2.micro"
  count = "2"
  subnet_id = "${var.subid_pub}"
  security_groups = ["${var.secur_gr_pub}"]
  associate_public_ip_address = "true"
  key_name = "${var.key_name}"
tags {
Type = "tomcat"
Name = "tomcat"
}
}

resource "aws_instance" "nginx" {
  ami           = "${var.ami_linux}"
  instance_type = "t2.micro"
  count = "1"
  subnet_id = "${var.subid_pub}"
  security_groups = ["${var.secur_gr_pub}"]
  associate_public_ip_address = "true"
  key_name = "${var.key_name}"
tags {
Type = "nginx"
Name = "nginx"
}
}

resource "aws_instance" "mysql" {
  ami           = "${var.ami_linux}"
  instance_type = "t2.micro"
  count = "1"
  subnet_id = "${var.subid_pub}"
  security_groups = ["${var.secur_gr_pub}"]
  associate_public_ip_address = "true"
  key_name = "${var.key_name}"
tags {
Type = "mysql"
Name = "mysql"
}
}
