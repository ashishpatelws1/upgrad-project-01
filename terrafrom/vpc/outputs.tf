output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "pub_sn_ids" {
  description = "IDs of the pub subnets"
  value       = module.vpc.public_subnets
}

output "pvt_sn_ids" {
  description = "IDs of the pvt subnets"
  value       = module.vpc.private_subnets
}