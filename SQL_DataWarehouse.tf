
 resource "azurerm_sql_warehouse" "SW" {
  name                = "${element(var.sql-warehouse,count.index)}"
  resource_group_name = "${azurerm_resource_group.RG-1.name}"
  location            = "${var.location}"
  server_name         = "${element(var.sql-warehouse,count.index)}"
  server_name         = "${element(azurerm_sql_server.sql-1.*.name,count.index)}" 
  count =  "${var.countDW}"
}