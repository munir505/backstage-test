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


variable "region" {
  description = "GCP region"
  type        = string
}

variable "services" {
  description = "Service APIs to enable."
  type        = list(string)
  default     = []
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
