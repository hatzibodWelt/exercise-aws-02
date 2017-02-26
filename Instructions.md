# Configuration

Before running edit variables.tf and add Keyname and AWS credentials

# Running

To create/destroy the instance run `terraform apply` or `terraform destroy` respectively. You will be prompted to configure 2 variables:

    - region
    - IP/IP range (CIDR)
   
Alternatively you can pass them as command line arguments.

 Examples: 
 ````
 terraform apply -var 'region=eu-west-1' -var 'ssh_whitelist=81.169.168.235/32'
 terraform destroy -var 'region=eu-west-1' -var 'ssh_whitelist=81.169.168.235/32'
 ````
 
## Notes
 Docker will be pre-installed in the new VM. 
 Since no configuration management tool is being used this is done using the "User Data" feature of EC2.
 The provisioning script is in the "provision" directory.
 Keyname can also be passes as a command line argument using -var 'keyname=NAME_OF_AWS_KEY'.
 
