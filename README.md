![alt text](https://www.terraform.io/assets/images/logo-hashicorp-3f10732f.svg)

# **tf-module-app-autoscaling-target**

Terraform module for creating Auto Scaling Target App for ***EC2 SPOT*** instances.

**Requirements**
  - Terraform
  - AWS Account

**Dependencies**
  - Launch Template
  - AWS Spot Fleet Request

  **Example of use**
 ------
```
module "app_autoscaling_target" {
  source = "https://github.com/leandromoreirati/tf-module-app_autoscaling_target.git"

  name       = "<RESOURCE_NAME>"

  autoscaling_app_target_namespace          = "${module.app_autoscaling_target.autoscaling_app_target_namespace}"
  autoscaling_app_target_resource_id        = "${module.app_autoscaling_target.autoscaling_app_target_id}"
  autoscaling_app_target_scalable_dimension = "${module.app_autoscaling_target.autoscaling_app_target_dimension}"
  adjustment_type                           = "${var.adjustment_type}"
  cooldown                                  = "${var.cooldown}"
  metric_interval_lower_bound               = "${var.metric_interval_lower_bound}"
  scaling_adjustment_scaleup                = "${var.scaling_adjustment_scaleup}"
  scaling_adjustment_scaledown              = "${var.scaling_adjustment_scaledown}"
}

```
 **Variables**
 ------
 |          NAME                              |                      Description                      |    Default    |
 | ------------------------------------------ |-------------------------------------------------------|:-------------:|
 |  max_capacity        |Maximum number of instances to scale                                         |      ""       |
 |  min_capacity        |Maximum number of instances to scale                                         |      ""       |
 |  resource_id         |Unique Scale Policy Membership ID                                            |      ""       |
 |  role_arn            |Role RNA that allows Application Autoscalig to change the number of instances|      ""       |
 |  scalable_dimension  |Dimension of scalable target                                                 |      ""       |
 |  service_namespace   |Sevice name space at AWS                                                     |      ""       |

 **Outputs**
 ------
 |              Nome                |                                 Value                                 |
 | ---------------------------------|:----------------------------------------------------------------------|
 | autoscaling_app_target_namespace | aws_appautoscaling_target.autoscaling_app_target.service_namespace    |
 | autoscaling_app_target_id        | aws_appautoscaling_target.autoscaling_app_target.resource_id          |
 | autoscaling_app_target_dimension | aws_appautoscaling_target.autoscaling_app_target.scalable_dimension   |
  

 **External Documentation**
 - [AWS Autoscaling](https://docs.aws.amazon.com/pt_br/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
 - [AWS Spot Fleet](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/spot-fleet.html#spot-instance-weighting)
 - [Terraform](https://www.terraform.io/docs/providers/aws/r/appautoscaling_target.html)

 **Created Resources**
 ------
 - Launch Template
 - IAM Role
 - Instance Profile
 - Security Group
 - AWS Spot Fleet Request
 - Auto Scaling Target