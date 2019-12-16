# **tf-module-app_autoscaling_target**

Módulo Terraform para criação de App Auto Scaling Target ***EC2 SPOT***.

 **Requisitos**
 - Terraform
 - AWS Account

 **Dependências**
 - Launch Template
 - AWS Spot Fleet Request

 **Criando App Auto Scaling Policy**
 ------
```
module "app_autoscaling_policy" {
  source = "../appAutoscalingPolicy"

  name       = "${var.my_team}-${var.product}-${var.environment}"

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
 **Variáveis**
 ------
 |          Nome                              |                      Descrição                             |    Default    |
 | ------------------------------------------ |------------------------------------------------------------|:-------------:|
 |  max_capacity        | Número máximo de instâncias a serem escaladas                                    |      ""       |
 |  min_capacity        | Número máximo de instâncias a serem escaladas                                    |      ""       |
 |  resource_id         | Resource ID unico de associação com a Scale Policy                               |      ""       |
 |  role_arn            | ARN da role que permite ao Application Autoscalig alterar o numero de instâncias |      ""       |
 |  scalable_dimension  | Dimensão do alvo que pode ser escalada                                           |      ""       |
 |  service_namespace   | Sevice name space na AWS                                                         |      ""       |

 **Outputs**
 ------
 |              Nome                |                                 Valor                                 |
 | ---------------------------------|:----------------------------------------------------------------------|
 | autoscaling_app_target_namespace | aws_appautoscaling_target.autoscaling_app_target.service_namespace    |
 | autoscaling_app_target_id        | aws_appautoscaling_target.autoscaling_app_target.resource_id          |
 | autoscaling_app_target_dimension | aws_appautoscaling_target.autoscaling_app_target.scalable_dimension   |
  

 **Documentação externa**
 - [AWS Autoscaling](https://docs.aws.amazon.com/pt_br/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
 - [AWS Spot Fleet](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/spot-fleet.html#spot-instance-weighting)
 - [Terraform](https://www.terraform.io/docs/providers/aws/r/appautoscaling_target.html)

 **Recursos Criados**
 ------
 - Launch Template
 - Role IAM
 - Instance Profile
 - Security Group
 - AWS Spot Fleet Request
 - Auto Scaling Target
