// Creating a new VPC to launch instances in. IP Range is hardcoded to 10.0.1.0/24 but that could be configurable.

resource "aws_vpc" "Welt24-VPC" {
  cidr_block = "10.0.1.0/24"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags {
    Name = "Welt24-VPC"
  }
}

resource "aws_subnet" "Welt24" {
  vpc_id = "${aws_vpc.Welt24-VPC.id}"
  cidr_block = "${aws_vpc.Welt24-VPC.cidr_block}"

  tags {
    Name = "Welt24-subnet"
  }
}
// Creating a new gateway for the VPC so that instances can have Internet access
resource "aws_internet_gateway" "Welt24-gw" {
  vpc_id = "${aws_vpc.Welt24-VPC.id}"
}

// Creating default routing roule.
resource "aws_route_table" "welt24-rt" {
  vpc_id = "${aws_vpc.Welt24-VPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.Welt24-gw.id}"
  }
}

// Adding default routing roule to VPC subnet
resource "aws_route_table_association" "Welt24-rta" {
  subnet_id = "${aws_subnet.Welt24.id}"
  route_table_id = "${aws_route_table.welt24-rt.id}"
}