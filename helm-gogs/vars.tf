variable "project" {
  description = "The project ID to create the resources in."
  type        = string
   default     =  "kuberproject-425010"
}
variable "region" {
  description = "The region to create the resources in."
  type        = string
  default     = "europe-west3"
}

variable "zone" {
  description = "The availability zone to create the sample compute instances in. Must within the region specified in 'var.region'"
  type        = string
  default     = "europe-west3-c"
}
variable "clusterName" {
  description = "cluster name to be created"
  default = "gogs-cluster"
}
variable "minNode" {
  description = "Minimum Node Count"
  default = "1"
}
variable "maxNode" {
  description = "maximum Node Count"
  default = "2"
}
variable "machineType" {
  description = "Node Instance machine type"
  default = "e2-medium"
}
