variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "project_number" {
  description = "Project number."
  type        = string
}

variable "folder_id" {
  description = "The numeric ID of the folder this project"
  type        = string
}


variable "project_parent" {
  description = "Parent folder or organization in 'folders/folder_id' or 'organizations/org_id' format."
  type        = string
  default     = null
  validation {
    condition     = var.project_parent == null || can(regex("(organizations|folders)/[0-9]+", var.project_parent))
    error_message = "Parent must be of the form folders/folder_id or organizations/organization_id."
  }
}

variable "project_create" {
  description = "Create project. When set to false, uses a data source to reference existing project."
  type        = bool
  default     = false
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "services" {
  description = "Service APIs to enable."
  type        = list(string)
  default     = []
}

variable "service_config" {
  description = "Disable the service when the Terraform resource is destroyed."
  type = object({
    disable_on_destroy         = bool
  })
  default = {
    disable_on_destroy         = true
  }
}

variable "service_config_api" {
  description = "Services that are enabled and which depend on this service should also be disabled when this service is destroyed."
  type = object({
    disable_dependent_services = bool
  })
  default = {
    disable_dependent_services = true
  }
}

variable "skip_delete" {
  description = "Allows the underlying resources to be destroyed without destroying the project itself."
  type        = bool
  default     = false
}

variable "parent" {
  description = "Parent folder or organization in 'folders/folder_id' or 'organizations/org_id' format."
  type        = string
  default     = null
  validation {
    condition     = var.parent == null || can(regex("(organizations|folders)/[0-9]+", var.parent))
    error_message = "Parent must be of the form folders/folder_id or organizations/organization_id."
  }
}

variable "prefix" {
  description = "Optional prefix used to generate project id and name."
  type        = string
  default     = null
  validation {
    condition     = var.prefix != ""
    error_message = "Prefix cannot be empty, please use null instead."
  }
}

variable "descriptive_name" {
  description = "Name of the project name. Used for project name instead of `name` variable."
  type        = string
  default     = null
}

variable "name" {
  description = "Project name and id suffix."
  type        = string
}

variable "labels" {
  description = "Resource labels."
  type        = map(any)
  default     = {}
}

variable "notification_channels" {
  description = "Alert policy notification channels"
  type        = list(string)
  default     = []
}

variable "ops_agent_os_types" {
  description = "A list of OS types to filter instances to apply the policy."
  type        = list(any)
  default     = []
}

variable "workflow_labels" {
  description = "Workflow required labels in the target project"
  type        = list(any)
  default     = []
}

variable "label" {
  description = "Workflow label variable"
  type        = string
  default     = null
}

variable "env" {
  description = "Ipsos project environment (prod/staging/dev)"
  type        = string
}