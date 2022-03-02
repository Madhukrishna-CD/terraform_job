
resource "aws_instance" "ec2" {
  ami = "${var.image_id}"
  instance_type = "${var.instance_type}"
  subnet_id = aws_subnet.private_subnet1.id
  
  tags = {
    name = "${var.instance_name}"
  }
}

# create sg for ec2
resource "aws_security_group" "sg0" {
  name        = "${var.sg_name0}"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
tags = {
  name = "${var.sg_name0}"
}
}


# Auto scaling lauch template for iis1

resource "aws_placement_group" "group_1" {
  name     = "${var.placement_group_name_1}"
  strategy = "partition"
  tags = {
    name = "${var.placement_group_name_1}"
  }
}

resource "aws_launch_template" "instance_1" {
  name_prefix   = "${var.launch_template_name_1}"
  image_id      = "${var.launch_template_ami_1}"
  instance_type = "${var.instance_type_1}"

  tags = {
    name = "${var.launch_template_name_1}"
  }
}
resource "aws_autoscaling_group" "bar_1" {
  name                      = "${var.autoscaling_group_name_1}"
  desired_capacity          = 1
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 30
  placement_group           = aws_placement_group.group_1.id
  health_check_type         = "EC2"
  vpc_zone_identifier       = [aws_subnet.private_subnet1.id]

  

  launch_template {
    id      = aws_launch_template.instance_1.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "policy_1" {
  name                   = "${var.policy_name_1}"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.bar_1.name
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_alaram_1" {
  alarm_name          = "${var.cloudwatch_alaram_1}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"
  
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.bar_1.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.policy_1.arn]
  actions_enabled = true
}

# Auto scaling lauch template for iis2

resource "aws_placement_group" "group_2" {
  name     = "${var.placement_group_name_2}"
  strategy = "partition"
  tags = {
    name = "${var.placement_group_name_2}"
  }
}

resource "aws_launch_template" "instance_2" {
  name_prefix   = "${var.launch_template_name_2}"
  image_id      = "${var.launch_template_ami_1}"
  instance_type = "${var.instance_type_1}"
  tags = {
    name = "${var.launch_template_name_1}"
  }
}
resource "aws_autoscaling_group" "bar_2" {
  name               = "${var.autoscaling_group_name_2}"
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  health_check_grace_period = 30
  placement_group           = aws_placement_group.group_2.id
  health_check_type         = "EC2"
  vpc_zone_identifier       = [aws_subnet.private_subnet2.id]

  

  launch_template {
    id      = aws_launch_template.instance_2.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "policy_2" {
  name                   = "${var.policy_name_2}"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.bar_2.name
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_alaram_2" {
  alarm_name          = "${var.cloudwatch_alaram_2}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"
  
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.bar_2.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.policy_2.arn]
  actions_enabled = true
}
