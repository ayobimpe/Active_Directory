#Create Application load balancer
  resource "aws_alb" "alb" {
    name	 = var.alb_name
    load_balancer_type = var.load_balancer_type
    security_groups    = [var.awsgss_lb_sg]
    subnets            = var.subnet_ids
    internal           = var.alb_internal
  }


# Create target group for the load balancer
  resource "aws_alb_target_group" "targetgrp" {
	  name	= var.targetgrp_name
    vpc_id = var.vpc_id
	  port	= var.httpsport
	  protocol	= var.httpprotocol
	  health_check {
		path = var.healthcheck_path
                port = var.httpsport
                protocol = var.httpprotocol
                healthy_threshold = var.healthy_threshold
                unhealthy_threshold = var.unhealthy_threshold
                interval = var.healthcheck_interval
		timeout  = var.health_check_timeout
		matcher  = var.health_check_matcher
          }
  }


#Create Listener for the load balancer
  resource "aws_alb_listener" "alb_listener" {
    load_balancer_arn = aws_alb.alb.arn
    port              = var.httpsport
    protocol          = var.httpprotocol
    ssl_policy        = var.ssl_policy
    certificate_arn   = var.ssl-cert
    default_action {
      type             = var.routing_action
      target_group_arn = aws_alb_target_group.targetgrp.arn
    }
  }

# Create Listener rule for the listener to direct the http traffic to
  resource "aws_alb_listener_rule" "listener_rule" {
    depends_on   = [aws_alb_target_group.targetgrp]  
    listener_arn = aws_alb_listener.alb_listener.arn 
    action {    
      type             = var.routing_action  
      target_group_arn = aws_alb_target_group.targetgrp.id 
    }   
    condition {    
      field  = var.field    
      values = [var.field_values]
    }
  }


# Attach existing instance to target group
resource "aws_alb_target_group_attachment" "tg_attachment" {
  target_group_arn = aws_alb_target_group.targetgrp.arn
  target_id        = var.domain_instance
  port             = var.httpsport
}
