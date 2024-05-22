resource "aws_subnet" "self" {
  for_each          = local.network_config.subnet.storage
  vpc_id            = aws_vpc.self.id
  availability_zone = "${local.aws_config.region}${each.key}"
  cidr_block        = each.value
}
