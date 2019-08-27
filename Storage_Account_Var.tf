variable "storage_account" {
  type = "list"
 default = ["sacc1","sacc2","sacc3"]
  //default =  "storage${count.index}"
}
variable "storage_container"{
type  ="list"
default =["container-1","container-2","container-3"]
}
variable "container_access_type" {
type ="list"
default =["private"]
  }

 variable "countSA" {
  type = "string"
  default= "3"
  
}
