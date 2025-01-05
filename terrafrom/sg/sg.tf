module "pub_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "pub-sg"
  #description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = ["10.0.0.0/16"]
}

module "pvt_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "pvt-sg"
  #description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = ["10.0.0.0/16"]
}

