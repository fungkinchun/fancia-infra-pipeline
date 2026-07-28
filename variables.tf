variable "tf_version" {
  description = "The version of the Terraform"
}

variable "project_name" {
  type        = string
  description = "The name of the project"
}

variable "environment" {
  type        = string
  description = "The environment of the project (e.g., dev, staging, prod)"
}

variable "region" {
  type        = string
  description = "The region of the project"
  default     = "eu-west-2"
}

variable "domain_name" {
  type        = string
  description = "The domain name for the project"
}

variable "profile" {
  type        = string
  description = "The AWS profile to use for authentication"
  default     = "default"
}

variable "github_username" {
  type        = string
  description = "The GitHub username for authentication"
}

variable "github_token" {
  type        = string
  description = "The GitHub token for authentication"
}

variable "use_eks" {
  type        = bool
  description = "Whether to use EKS for the project"
  default     = false
}

variable "infra_credentials" {
  description = "Central map of infrastructure credentials and configuration"
  type = object({
    project_name    = string
    domain_name     = string
    region          = string
    profile         = string
    github_username = string
    github_token    = string
    email           = string
    use_eks         = bool
    repositories = list(object({
      name                     = string
      is_service               = bool
      port                     = optional(number)
      override_with_shared_rds = optional(string)
    }))
    credentials = list(object({
      name = string
      objects = list(object({
        environment = string
        description = string
        value       = map(string)
        namespace   = string
      }))
    }))
  })
}

variable "dockerhub_credentials" {
  description = "DockerHub credentials for authentication"
  type = object({
    username = string
    token    = string
  })
}
