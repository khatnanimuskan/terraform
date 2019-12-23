resource "azurerm_resource_group" "RG" {
  name     = "${var.Resource_Group}"
  location = "${var.location}"
}

resource "azurerm_storage_account" "functionstorageaccount" {
  name                     = "${var.functionapp_storage}"
  resource_group_name      = "${azurerm_resource_group.RG.name}"
  location                 = "${azurerm_resource_group.RG.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
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
  name                      = "${var.Function_App}"
  location                  = "${azurerm_resource_group.RG.location}"
  resource_group_name       = "${azurerm_resource_group.RG.name}"
  app_service_plan_id       = "${azurerm_app_service_plan.Service-plan.id}"
  storage_connection_string = "${azurerm_storage_account.functionstorageaccount.primary_connection_string}"
}
