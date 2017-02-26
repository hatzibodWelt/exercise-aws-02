resource "aws_security_group" "Welt24-SG" {
    name        = "Welt24-SG"
    vpc_id = "${aws_vpc.Welt24-VPC.id}"
    description = "Security Group for Welt24"
    depends_on  = ["aws_vpc.Welt24-VPC"]
    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["${var.ssh_whitelist}"]
    }

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    tags{
        Name = "Welt24-SG"
    }
}

