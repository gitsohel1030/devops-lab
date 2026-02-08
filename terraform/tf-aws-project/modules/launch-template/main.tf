resource "aws_launch_template" "tf_launch_template" {
    # name = "tf_launch_template"
    name_prefix = "${var.name}-lt-"
    image_id = var.ami_id
    instance_type = var.instance_type

    iam_instance_profile {
      name = var.instance_profile_name
    }

    vpc_security_group_ids = [var.ec2_sg_id]

    user_data = var.user_data

    lifecycle {
      create_before_destroy = true
    }

    tag_specifications {
      resource_type = "instance"

      tags = {
        name = "tf_LT_instance"
      }
    }

    tag_specifications {
      resource_type = "volume"

      tags = {
        Name = "tf_LT_volume"
      }
    }

    metadata_options {
      http_tokens = "required"
      http_endpoint = "enabled"
    }
  
}