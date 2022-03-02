output "vpc" {
    value = aws_vpc.vpc
    description = "vpc output" 
}
output "public_subnet1" {
    value = aws_subnet.public_subnet1
    description = "output for public subnet 1"
}
output "public_subnet2" {
    value = aws_subnet.public_subnet2
    description = "output for public subnet 2"
}
output "private_subnet1" {
    value = aws_subnet.private_subnet1
    description = "output for private subnet 1"
}
output "private_subnet2" {
    value = aws_subnet.private_subnet2
    description = "output for private subnet 2"
}
output "ec2_instance" {
    value = aws_instance.ec2
    description = "output for instance"
}
output "autoscaling_group" {
    value = aws_autoscaling_group.bar_1
    description = "output for autoscaling group"
}
output "eip" {
    value = aws_eip.eip
    description = "output for eip route53"
}
output "redis" {
    value = aws_elasticache_cluster.elasticcache
    description = "output for elastic cache "
}
output "alb" {
    value = aws_lb.alb
    description = "output for Application loadbalancer "
}
output "hosted_zone" {
    value = aws_route53_zone.hostedzone
    description = "output for route 53 hosted zone"
}
output "cloudfront" {
  value       = aws_cloudfront_distribution.Alb_distribution
  description = "output for CDN "
}

output "iam_group" {
  value       = aws_iam_group.devops_support
  description = "output for iam group"
}

output "iam_user" {
  value       = aws_iam_user.cd_devops
  description = "output for iam user"
}

# output "guardduty" {
#     value = aws_guardduty_detector.hub_gaurdduty
#     description = "output for guard duty"  
# }
