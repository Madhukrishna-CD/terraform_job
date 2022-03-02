#Create a IAM group
resource "aws_iam_group" "devops_support" {
  name = "${var.iam_group_name}"
}

#create policy attachment to the group
resource "aws_iam_policy_attachment" "devops_attachment" {
  name       = "${var.iam_policy_attachment_name}"
  groups     = [aws_iam_group.devops_support.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy" "devops_support_policy" {
  name  = "${var.iam_group_policy_name}"
  group = aws_iam_group.devops_support.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# create iam user
resource "aws_iam_user" "cd_devops" {
  name = "${var.iam_user_name}"
}

resource "aws_iam_access_key" "key" {
  user = aws_iam_user.cd_devops.name
}

# add users to the group.
resource "aws_iam_group_membership" "devopsusers" {
  name  = "${var.iam_group_membership_name}"
  users = [aws_iam_user.cd_devops.name]
  group = aws_iam_group.devops_support.name
}



resource "aws_iam_user_policy" "user_policy" {
  name = "${var.iam_user_policy_name}"
  user = aws_iam_user.cd_devops.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}