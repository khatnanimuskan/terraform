
variable "sql_server" {
    type ="list"
 default =["sql-servr-1","sql-servr-2","sql-server-3","sql-server-4","sql-server-5","sql-server-6","sql-server-7","sql-server-8","sql-server-9","sql-server-10"]
 //default =["sql-server-0","sql-servr-2","sql-server-2"]

}
variable "administrator_login" {
  type ="string"
  default = "Abbot_SQL"
}
variable "administrator_login_password" {
  type ="string"
  default ="Password@123"
}
variable "count" {
  type = "string"
  default= "10"
  
}



