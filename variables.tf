variable "region" {
  description = "AWS region to use"
}
variable "ssh_whitelist" {
  description = "IP/IP range to whitelist for SSH access (CIDR notation)"
}
variable "keyname" {
  // Add default keyname here
  default = "CHANGEME"
}

provider "aws" {
  // Add AWS credentials
  access_key = "CHANGEME"
  secret_key = "CHANGEME"
  region     = "${var.region}"
}
variable "amis" {
  description = "Base AMI to launch the instances with"
  type = "map"
  default = {
    eu-west-1 = "ami-70edb016"
    eu-west-2 = "ami-f1949e95"
    eu-central-1 = "ami-af0fc0c0"
    us-east-1 = "ami-0b33d91d"
    us-east-2 = "ami-c55673a0"
    us-west-1 = "ami-165a0876"
    us-west-2 = "ami-f173cc91"
    ca-central-1 = "ami-ebed508f"
    ap-southeast-1 = "ami-dc9339bf"
    ap-northeast-2 = "ami-dac312b4"
    ap-northeast-1 = "ami-56d4ad31"
    ap-southeast-2 = "ami-1c47407f"
    ap-south-1 = "ami-f9daac96"
    sa-east-1 = "ami-80086dec"
  }
}
output "Instance Public IP" {
  value = "${aws_instance.Welt24.public_ip}"
}
