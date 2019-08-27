provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.28.0"
}

resource "azurerm_sql_server" "sql-1" {
  name                         = "${element(var.sql_server,count.index)}"
  resource_group_name          = "${azurerm_resource_group.RG-1.name}"
  location                     = "${var.location}"
  version                      = "12.0"
  administrator_login          = "${var.administrator_login}"
  administrator_login_password = "${var.administrator_login_password}"
  count = "${var.count}"
}