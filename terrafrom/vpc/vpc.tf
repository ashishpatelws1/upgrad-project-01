module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "ap-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  public_subnets  = ["10.0.11.0/24", "10.0.21.0/24"]
  private_subnets = ["10.0.12.0/24", "10.0.22.0/24"]
 

  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
