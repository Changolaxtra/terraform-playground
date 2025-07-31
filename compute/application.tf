resource "aws_launch_template" "epam_launch_template" {
  name                                 = "epam-tf-lab"
  image_id                             = "ami-0dbc3d7bc646e8516"
  user_data                            = filebase64("${path.module}/files/init.sh")
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = "t2.micro"

  iam_instance_profile {
    name = data.terraform_remote_state.base.outputs.iam_instance_profile_name
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "epam-tf-lab"
    }
  }
}

resource "aws_autoscaling_group" "elastic_group" {
  name = "autocaling-group"
  desired_capacity = 1
  max_size         = 1
  min_size         = 1
  vpc_zone_identifier = data.terraform_remote_state.base.outputs.public_subnet_ids
  

  launch_template {
    id = aws_launch_template.epam_launch_template.id
  }
}

resource "aws_elb" "elb" {
  name            = "elb-epam-tf-lab"
  internal        = false

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  tags = {
    Environment = "production"
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.elastic_group.id
  elb                    = aws_elb.elb.id
}
