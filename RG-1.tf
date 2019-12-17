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
resource "azurerm_storage_account" "sa" {
  name                     = "storageaccou234"
  resource_group_name      = "${azurerm_resource_group.RG-1.name}"
  location                 = "${azurerm_resource_group.RG-1.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}
