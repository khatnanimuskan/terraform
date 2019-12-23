resource "azurerm_resource_group" "RG" {
  name     = "${var.Resource_Group}"
  location = "${var.location}"
}
resource "azurerm_virtual_network" "Vnet" {
  name                = "${var.Virtual_Network}-vnet"
  location            = "${azurerm_resource_group.RG.location}"
  resource_group_name = "${azurerm_resource_group.RG.name}"
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "Subnet" {
name =                  "${var.Subnet_name}" 
address_prefix =        "10.0.1.0/24"  
virtual_network_name =  "${azurerm_virtual_network.Vnet.name}"
resource_group_name =   "${azurerm_resource_group.RG.name}"

}
resource "azurerm_storage_account" "functionstorageaccount" {
  name                     = "${element(var.functionapp_storage, count.index)}"
  resource_group_name      = "${azurerm_resource_group.RG.name}"
  location                 = "${azurerm_resource_group.RG.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  count                    =  "3"
}
resource "azurerm_app_service_plan" "Service-plan" {
  name                = "${var.App_Service_Plan}"
  location            = "${azurerm_resource_group.RG.location}"
  resource_group_name = "${azurerm_resource_group.RG.name}"

  sku {
    tier = "${var.SKU}"
    size = "S1"
  }
}

resource "azurerm_function_app" "Function-App" {
  name                      = "${element(var.Function_App, count.index)}"
  location                  = "${azurerm_resource_group.RG.location}"
  resource_group_name       = "${azurerm_resource_group.RG.name}"
  app_service_plan_id       = "${azurerm_app_service_plan.Service-plan.id}"
  storage_connection_string = "${azurerm_storage_account.functionstorageaccount.primary_connection_string}"
  #storage_connection_string = "${azurerm_storage_account.functionstorageaccount[count.index] }"
  count                      = "3"
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = "${var.storageaccountname}"
  resource_group_name      = "${azurerm_resource_group.RG.name}"
  location                 = "${azurerm_resource_group.RG.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_table" "storagetable" {
  name                 = "${var.storageaccounttablename}"
  resource_group_name  = "${azurerm_resource_group.RG.name}"
  storage_account_name = "${azurerm_storage_account.storageaccount.name}"
}