module "Prod" {
  source                     = "../../modules/hub"
  vpc_cidr                   = var.vpc_cidr
  vpc_name                   = var.vpc_name
  public_subnet1_cidr        = var.public_subnet1_cidr
  availability_zone_ps1      = var.availability_zone_ps1
  public_subnet1_name        = var.public_subnet1_name
  availability_zone_ps2      = var.availability_zone_ps2
  public_subnet2_cidr        = var.public_subnet2_cidr
  public_subnet2_name        = var.public_subnet2_name
  private_subnet1_cidr       = var.private_subnet1_cidr
  availability_zone_prts1    = var.availability_zone_prts1
  private_subnet1_name       = var.private_subnet1_name
  private_subnet2_cidr       = var.private_subnet2_cidr
  availability_zone_prts2    = var.availability_zone_prts2
  private_subnet2_name       = var.private_subnet2_name
  image_id                   = var.image_id
  instance_type              = var.instance_type
  instance_name              = var.instance_name
  sg_name0                   = var.sg_name0
  launch_template_name_1     = var.launch_template_name_1
  launch_template_ami_1      = var.launch_template_ami_1
  instance_type_1            = var.instance_type_1
  placement_group_name_1     = var.placement_group_name_1
  autoscaling_group_name_1   = var.autoscaling_group_name_1
  policy_name_1              = var.policy_name_1
  cloudwatch_alaram_1        = var.cloudwatch_alaram_1
  launch_template_name_2     = var.launch_template_name_2
  launch_template_ami_2      = var.launch_template_ami_2
  instance_type_2            = var.instance_type_2
  placement_group_name_2     = var.placement_group_name_2
  autoscaling_group_name_2   = var.autoscaling_group_name_2
  policy_name_2              = var.policy_name_2
  cloudwatch_alaram_2        = var.cloudwatch_alaram_2
  alb_name                   = var.alb_name
  security_group_name        = var.security_group_name
  lb_target_group_name       = var.lb_target_group_name
  rds_cluster_identifier     = var.rds_cluster_identifier
  db_username                = var.db_username
  db_pwd                     = var.db_pwd
  rds_name                   = var.rds_name
  dbsubnet_name              = var.dbsubnet_name
  db_parameter_group_name    = var.db_parameter_group_name
  rds_cluster_pg_name        = var.rds_cluster_pg_name
  hostedzone_website_name    = var.hostedzone_website_name
  hostzone_name              = var.hostzone_name
  sg_name1                   = var.sg_name1
  cluster_id_name            = var.cluster_id_name
  elastic_subnet_name        = var.elastic_subnet_name
  sg_name2                   = var.sg_name2
  Endpoint_name              = var.Endpoint_name
  route_table_name           = var.route_table_name
  internet_gateway_name      = var.internet_gateway_name
  iam_group_name             = var.iam_group_name
  iam_policy_attachment_name = var.iam_policy_attachment_name
  iam_group_policy_name      = var.iam_group_policy_name
  iam_user_name              = var.iam_user_name
  iam_group_membership_name  = var.iam_group_membership_name
  iam_user_policy_name       = var.iam_user_policy_name
  domain_name                = var.domain_name
  CDN_name                   = var.CDN_name
  waf_name                   = var.waf_name
}