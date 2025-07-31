resource "aws_security_group" "ssh_inbound" {
  name        = "ssh-inbound"
  description = "allows ssh access from safe IP-range"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    description = "ssh ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-inbound"
  }
}

resource "aws_security_group" "http_inbound" {
  name        = "http-inbound"
  description = "allows http access from LoadBalancer"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    description = "http ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http-inbound"
  }
}

resource "aws_security_group" "lb_http_inbound" {
  name        = "lb-http-inbound"
  description = "allows http access from safe IP-range to a LoadBalancer"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    description = "http ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "lb-http-inbound"
  }
}

resource "aws_security_group_rule" "rule_http_inbound_lb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.http_inbound.id
  source_security_group_id = aws_security_group.lb_http_inbound.id
}