variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', or 'prod'.)"
  sensitive   = false

  validation {
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', and 'nonprod'"
  }
}

variable "program" {
  type        = string
  description = "the program associated with the application"
  sensitive   = false

  validation {
    condition     = contains(["crdc", "ccdi", "ctos"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', and 'ctos'"
  }
}

variable "port" {
  type        = number
  description = "port on which targets receive traffic, unless overridden when registering a specific target"
}

variable "vpc_id" {
  type        = string
  description = "id of the vpc the target group is deployed to"
}

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "health_check_port" {
  type    = string
  default = "traffic-port"
}

variable "health_check_protocol" {
  type    = string
  default = "HTTP"
}

variable "health_check_matcher" {
  type    = string
  default = "200"
}

variable "health_check_interval" {
  type    = number
  default = 30
}

variable "health_check_timeout" {
  type    = number
  default = 20
}

variable "health_check_healthy_threshold" {
  type    = number
  default = 5
}

variable "health_check_unhealthy_threshold" {
  type    = number
  default = 5
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "resource_name_suffix" {
  type        = string
  description = "the suffix of the target group name following the stack name"
}

variable "stickiness_cookie_duration" {
  type        = number
  description = "The time period, in seconds, during which requests from a client should be routed to the same target."
  default     = 1800
}

variable "stickiness_enabled" {
  type        = bool
  description = "Enable or disable stickiness"
  default     = true
}

variable "stickiness_type" {
  type        = string
  description = "The type of sticky sessions. The only current possible values are lb_cookie, app_cookie for ALBs, and source_ip for NLBs"
  default     = "lb_cookie"
}

variable "target_type" {
  type    = string
  default = "ip"
}