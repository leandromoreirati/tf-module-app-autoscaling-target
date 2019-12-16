
variable "name" {
  default = ""
  description = "Name of resource."
}

variable "tags" {
  type    = "map"
  default = {}
  description = "Setting tags for the feature" 
}

variable "product" {
  default = ""
  description = "Product our project name."
}

variable "environment" {
  default = ""
  description = "Application environment."
}
variable "max_capacity" {
  default = ""
  description = "The max capacity of the scalable target."
}

variable "min_capacity" {
  default = ""
  description = "The min capacity of the scalable target."
  
}
variable "resource_id" {
  default = ""
  description = "The resource type and unique identifier string for the resource associated with the scaling policy"
}

variable "role_arn" {
  default = ""
  description = "The ARN of the IAM role that allows Application AutoScaling to modify your scalable target on your behalf."
  
}

variable "iam_role_scale" {
  default = ""
  description = "The ARN of the IAM role that allows Application AutoScaling to modify your scalable target on your behalf."  
}

variable "scalable_dimension" {
  default = ""
  description = "The scalable dimension of the scalable target. Documentation can be found in the ScalableDimension."
}

variable "service_namespace" {
  default = ""
  description = "The AWS service namespace of the scalable target."
}

variable "spot_fleet_request_id" {
  default = ""
  description = "Spot Requestt ID."
}