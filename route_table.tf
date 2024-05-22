resource "aws_route_table" "self" {
  vpc_id = aws_vpc.self.id
}

resource "aws_route" "self" {
  route_table_id         = aws_route_table.self.id
  gateway_id             = aws_internet_gateway.self.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "self" {
  for_each       = toset(local.network_config.availability_zones)
  subnet_id      = aws_subnet.self[each.value].id
  route_table_id = aws_route_table.self.id
}
