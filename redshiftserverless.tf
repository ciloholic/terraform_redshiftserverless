resource "aws_redshiftserverless_namespace" "self" {
  namespace_name      = "${local.service_config.prefix}-redshiftserverless"
  admin_username      = "admin"
  admin_user_password = "Password1234!"
}

resource "aws_redshiftserverless_workgroup" "self" {
  depends_on = [aws_redshiftserverless_namespace.self]

  namespace_name     = aws_redshiftserverless_namespace.self.id
  workgroup_name     = "test-workgroup"
  security_group_ids = [aws_security_group.self.id]
  subnet_ids = [
    for az in local.network_config.availability_zones :
    aws_subnet.self[az].id
  ]
  publicly_accessible = true
}
