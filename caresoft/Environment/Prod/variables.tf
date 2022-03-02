# variable for region
variable "aws_region" {
  type = string
}

# variable for vpc
variable "vpc_cidr" {
  type = string
}
variable "vpc_name" {
  type = string
}

# variable for public subnet 1
variable "public_subnet1_cidr" {
  type = string
}
variable "public_subnet1_name" {
  type = string
}
variable "availability_zone_ps1" {
  type = string
}

# variable for public subnet 2
variable "public_subnet2_cidr" {
  type = string
}
variable "availability_zone_ps2" {
  type = string
}
variable "public_subnet2_name" {
  type = string
}

# variable for private subnet 1
variable "private_subnet1_cidr" {
  type = string
}
variable "availability_zone_prts1" {
  type = string
}
variable "private_subnet1_name" {
  type = string
}

# variable for private subnet 2
variable "private_subnet2_cidr" {
  type = string
}
variable "availability_zone_prts2" {
  type = string
}
variable "private_subnet2_name" {
  type = string
}

# variable for ec2 instance
variable "image_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "instance_name" {
  type = string
}

# variable for security group
variable "sg_name0" {
  type = string
}

# variable for launch template 1
variable "launch_template_name_1" {
  type = string
}
variable "launch_template_ami_1" {
  type = string
}
variable "instance_type_1" {
  type = string
}

# variabe for autoscaling placement group
variable "placement_group_name_1" {
  type = string
}

# variable for autoscaling group 
variable "autoscaling_group_name_1" {
  type = string
}

# variable for autoscaling policy
variable "policy_name_1" {
  type = string
}

# variable for autoscaling cloudwatch alaram
variable "cloudwatch_alaram_1" {
  type = string
}
# variable for launch template 2
variable "launch_template_name_2" {
  type = string
}
variable "launch_template_ami_2" {
  type = string
}
variable "instance_type_2" {
  type = string
}
# variabe for autoscaling placement group 2
variable "placement_group_name_2" {
  type = string
}

# variable for autoscaling group 2
variable "autoscaling_group_name_2" {
  type = string
}

# variable for autoscaling policy 2
variable "policy_name_2" {
  type = string
}

# variable for autoscaling cloudwatch alaram 2
variable "cloudwatch_alaram_2" {
  type = string
}

# variable for Application load balancer 
variable "alb_name" {
  type = string
}

# variable for target group
variable "lb_target_group_name" {
  type = string
}

# variable for security group alb
variable "security_group_name" {
  type = string
}

# variable for dbinstance rds
variable "rds_cluster_identifier" {
  type = string
}
variable "db_username" {
  type = string
}
variable "db_pwd" {
  type = string
}
variable "rds_name" {
  type = string
}

# variable for dbsubnet rds
variable "dbsubnet_name" {
  type = string
}

# variable for db parameter group
variable "db_parameter_group_name" {
  type = string
}
# variable for rds parameter group
variable "rds_cluster_pg_name" {
  type = string
}

# variable for security group RDS
variable "sg_name2" {
  type = string
}

# variable for route53 hosted zone
variable "hostedzone_website_name" {
  type = string
}
variable "hostzone_name" {
  type = string
}

# variable for redis
variable "cluster_id_name" {
  type = string
}
# variable for elastic cache subnet group
variable "elastic_subnet_name" {
  type = string
}

# variable for security group redis
variable "sg_name1" {
  type = string
}

# variable for vpc endpoint
variable "Endpoint_name" {
  type = string
}
# variable for route table
variable "route_table_name" {
  type = string
}

# variable for internet gateway
variable "internet_gateway_name" {
  type = string
}
# variable for iam group
variable "iam_group_name" {
  type = string
}
# variable for iam policy attachment
variable "iam_policy_attachment_name" {
  type = string
}
# variable for iam group policy 
variable "iam_group_policy_name" {
  type = string
}
# variable for iam user
variable "iam_user_name" {
  type = string
}
# variable for add users to the group
variable "iam_group_membership_name" {
  type = string
}
# variable for iam user policy
variable "iam_user_policy_name" {
  type = string
}

# variable for cloudfront
variable "domain_name" {
  type = string
}
variable "CDN_name" {
  type = string
}
# variable for waf
variable "waf_name" {
  type = string
}