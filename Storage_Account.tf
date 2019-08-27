


resource "azurerm_storage_account""SA-1" {
 count                     =   "${var.countSA}"
  name                     ="${element(var.storage_account,count.index)}"
  resource_group_name      = "${azurerm_resource_group.RG-1.name}"
  location                 = "${azurerm_resource_group.RG-1.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

resource "azurerm_storage_container" "SC-1" {
  name                  =    "${element(var.storage_container,count.index)}"
  count                 =   "${var.countSA}"
  resource_group_name   = "${azurerm_resource_group.RG-1.name}"
  storage_account_name  = "${element(var.storage_account,count.index)}"
  container_access_type = "${element(var.container_access_type,count.index)}"
}