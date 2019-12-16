/* APP AUTOSCALING GROUP */
output "autoscaling_app_target_namespace" {
  value = "${aws_appautoscaling_target.autoscaling_app_target.service_namespace}"
}

output "autoscaling_app_target_id" {
  value = "${aws_appautoscaling_target.autoscaling_app_target.resource_id}"
}

output "autoscaling_app_target_dimension" {
  value = "${aws_appautoscaling_target.autoscaling_app_target.scalable_dimension}"
}