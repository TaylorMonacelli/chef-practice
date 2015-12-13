provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_route53_record" "chef" {
  zone_id = "${var.streambox_zone}"
  ttl = "60"
  name = "chef.streambox.com"
  type = "A"
  records = ["${aws_instance.chef.public_ip}"]
}

resource "aws_instance" "chef" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "m3.medium"
  key_name = "ephemeral-test"
  security_groups = ["${aws_security_group.chef.name}"]
  monitoring = true
  root_block_device {
	volume_size = "100"
  }

  tags {
	Name = "chef"
  }

  connection {
	agent = false
	user = "ubuntu"
	key_file = "~/.ssh/ephemeral-test.pem"
  }

  provisioner "file" {
	source = "script.sh"
	destination = "/tmp/script.sh"
  }

  provisioner "file" {
	source = "sethosts.sh"
	destination = "/tmp/sethosts.sh"
  }

  provisioner "remote-exec" {
	inline = [
	  "cp -R /home/ubuntu/.ssh /root" # enables ssh root@chef
	  ,"sh -x /tmp/sethosts.sh >/etc/hosts" # update hosts to chef.streambox.com
	  ,"echo chef >/etc/hostname"
	]
  }

}

resource "aws_security_group" "chef" {
  name = "chef"
  description = "Allow ssh inbound traffic from everywhere"

  ingress {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
	from_port = 443
	to_port = 443
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
	Name = "chef"
  }
}


output "sship" {
  value = "ssh -i ~/.ssh/ephemeral-test.pem ubuntu@${aws_instance.chef.public_ip}"
}
output "sshdns" {
  value = "ssh -i ~/.ssh/ephemeral-test.pem ubuntu@${aws_route53_record.chef.name}"
}
