terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }
  }

  # Terrafrom State store S3
  backend "s3" {
    bucket = "ap-s3-tf-store"
    key    = "tfstate/terraform.tfstate"
    region = "us-west-2"
  }

}

provider "aws" {
  # AWS Region
  region = "us-west-2"
}

module "vpc" {
  source = "./vpc"
}

module "sg" {
  source = "./sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./ec2"
  pub_sn_id = module.vpc.pub_sn_ids[0]
  pub_sg_id = module.sg.pub_sg_id

  pvt_sn_id_1 = module.vpc.pvt_sn_ids[0]
  pvt_sg_id = module.sg.pvt_sg_id

  pvt_sn_id_2 = module.vpc.pvt_sn_ids[1]

}