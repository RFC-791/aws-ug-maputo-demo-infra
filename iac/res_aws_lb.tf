resource "aws_lb" "ingress" {
  name               = "aws-ug-maputo-ingress"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = tolist([aws_subnet.pub1a.id, aws_subnet.pub1b.id])

  enable_deletion_protection = true
}

resource "aws_lb_listener" "ingress" {
  load_balancer_arn = aws_lb.ingress.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "You are good to go!"
      status_code  = "200"
    }
  }
}

resource "aws_security_group" "lb_sg" {
  name        = "${local.prefix}-lb-sg"
  description = "Ingress security group"
  vpc_id      = aws_vpc.pvt.id

}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.lb_sg.id
  cidr_ipv4         = aws_vpc.pvt.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

