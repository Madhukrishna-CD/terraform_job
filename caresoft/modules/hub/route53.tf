resource "aws_route53_zone" "hostedzone" {
  name = "${var.hostedzone_website_name}"

  tags = {
    Name = var.hostzone_name
  }
}
