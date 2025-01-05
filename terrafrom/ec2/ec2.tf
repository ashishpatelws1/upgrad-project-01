# EC2 bastion 
module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "bastion"
  
  #ami                    = "ami-0e2c8caa4b6378d8c" 
  ami                    = "ami-05d38da78ce859165"
  instance_type          = "t2.medium"
  key_name               = "ap-kp-aws09"
  monitoring             = true
  vpc_security_group_ids = [var.pub_sg_id]
  subnet_id              = var.pub_sn_id
  associate_public_ip_address = true
  
  root_block_device = [{
    volume_type = "gp2"
    volume_size = 20
    delete_on_termination = true
  }]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# EC2 Jenkins 
module "jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "jenkins"
  
  ami                    = "ami-05d38da78ce859165"
  instance_type          = "t2.medium"
  key_name               = "ap-kp-aws09"
  monitoring             = true
  vpc_security_group_ids = [var.pvt_sg_id]
  subnet_id              = var.pvt_sn_id_1
  associate_public_ip_address = false
  
  root_block_device = [{
    volume_type = "gp2"
    volume_size = 20
    delete_on_termination = true
  }]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# EC2 App 
module "app" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "app"
  
  ami                    = "ami-05d38da78ce859165"
  instance_type          = "t2.medium"
  key_name               = "ap-kp-aws09"
  monitoring             = true
  vpc_security_group_ids = [var.pvt_sg_id]
  subnet_id              = var.pvt_sn_id_2
  associate_public_ip_address = false
  
  root_block_device = [{
    volume_type = "gp2"
    volume_size = 20
    delete_on_termination = true
  }]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
