resource "aws_route53_record" "expense" {
  for_each = aws_instance.expense   # each.key and each.value
  zone_id = var.zone_id
  #name = local.record_name  count and count ,index will not work in locals
  name    = each.key == "frontend.prod" ? var.domain_name : "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  #records = local.record_ip   count and count ,index will not work in locals
  records = each.key == "frontend" ? [each.value.public_ip]: [each.value.private_ip]
  # if already exit
  allow_overwrite = true
}