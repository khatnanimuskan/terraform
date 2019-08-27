  variable "sql_database"{
     type = "list"
     default = ["sql-database","sql-database-2","sql-database-3","sql-database-4","sql-database-5","sql-database-6","sql-database-7","sql-database-8","sql-database-9","sql-database-10"]
    // default = ["SQL-Database-1","SQL-Database-2","SQL-Database-3"]
}

variable "countDB" {
  type = "string"
  default= "10"
  
}