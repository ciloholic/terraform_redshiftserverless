resource "aws_internet_gateway" "self" {
  vpc_id = aws_vpc.self.id
}
