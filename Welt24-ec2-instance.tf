resource "aws_instance" "Welt24" {
    // Creating instance in a new VPC
    ami                         = "${lookup(var.amis, var.region)}"
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "${var.keyname}"
    subnet_id                   = "${aws_subnet.Welt24.id}"
    vpc_security_group_ids      = ["${aws_security_group.Welt24-SG.id}"]
    associate_public_ip_address = true
    user_data                   = "${file("provision/provision.sh")}"
    depends_on                  = ["aws_security_group.Welt24-SG","aws_subnet.Welt24"]
    tags {
        "Name" = "Welt24"
    }
}

