locals {
    files_list = [
        "${md5(file("${path.module}/main.tf"))}",
        "${md5(file("${path.module}/output.tf"))}",
        "${md5(file("${path.module}/variables.tf"))}",
    ]
    current_deployment = "${join("", local.files_list)}"
}

resource "aws_appautoscaling_target" "autoscaling_app_target" {
  max_capacity       = "${var.max_capacity}"
  min_capacity       = "${var.min_capacity}"
  resource_id        = "spot-fleet-request/${var.spot_fleet_request_id}"
  role_arn           = "${var.iam_role_scale}"
  scalable_dimension = "${var.scalable_dimension}"
  service_namespace  = "${var.service_namespace}"
}