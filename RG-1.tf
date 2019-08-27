variable "resource_group" {
 default ="RG-1"
}

variable "location" {
default ="Central US"
}

resource "azurerm_resource_group" "RG-1" {
name = "${var.resource_group}" 
location = "${var.location}"
}