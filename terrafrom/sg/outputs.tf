output "pub_sg_id" {
  description = "ID of the VPC"
  value       = module.pub_sg.security_group_id
}

output "pvt_sg_id" {
  description = "ID of the VPC"
  value       = module.pvt_sg.security_group_id
}