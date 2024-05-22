resource "aws_security_group" "self" {
  vpc_id = aws_vpc.self.id
  name   = "${local.service_config.prefix}-redshift"
}

resource "aws_security_group_rule" "self_1" {
  security_group_id = aws_security_group.self.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 5439
  to_port           = 5439
  cidr_blocks       = ["0.0.0.0/0"] # TODO: IP制限
}

resource "aws_security_group_rule" "self_2" {
  security_group_id = aws_security_group.self.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}
