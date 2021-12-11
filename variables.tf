variable "cluster_name" {
  description = "The name of the cluster"
  type        = string
  default     = "karpenter-sample"
}

variable "cluster_version" {
  description = "Version of the cluster"
  type        = string
  default     = "1.21"
}

variable "region" {
  description = "region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "My IP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
