locals {
  common_tags = {
    Assignment = " Automation Assignment"
    Name = "Srujal Shah"
    ExpirationDate = "2024-12-31"
    Environment = "Learning"
  }
}

variable "location" {
  description = "Location for the resource group"
  type        = string
  default     = "canadacentral"
}

variable "resource_group_name" {
	default	= "0815-RG"
}

variable "vnet_name" {
	default	= "0815-VNET"
}

variable "subnet_name" {
	default = "0815-SUBNET"
}

variable "nsg_name" {
	default = "0815-NSG"
}
