
resource "azurerm_resource_group" "RG-1" {
name = "Devpopsrg" 
location = "Central US"
}
resource "azurerm_storage_account" "sa" {
  name                     = "storageaccou234"
  resource_group_name      = "${azurerm_resource_group.RG-1.name}"
  location                 = "${azurerm_resource_group.RG-1.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}
