variable "environment" {
  default = ""
}


variable "Resource_Group" {
    type ="string"
    default = "EI-iPaaS-RG"
  
}
variable "location" {
    type ="string"
    default = "westus2"
  
}
variable "Virtual_Network" {
    type = "string"
    default = "EI-iPaaS-QA-VNet"
}
variable "Subnet_name" {
  type ="string"
  default ="EI-iPaaS-QA-Subnet"
}

variable "functionapp_storage" {
    type ="list"
    default = ["eiipaasqafunctionappsa0","eiipaasqafunctionappsa1","eiipaasqafunctionappsa2"]
  
}
variable "App_Service_Plan" {
    type ="string"
    default ="EI-iPaaS-QA-Service-Plan"
  
}
variable "SKU" {
    type= "string"
    default ="Standard"  
}

variable "Function_App" {
    type = "list"
    default = ["EI-iPaaS-QA-Function-App","EI-iPaaS-QA-Function-App1","EI-iPaaS-QA-Function-App"]
}

variable "storageaccountname" {
    type = "string"
    default = "eiipaasqastorageaccount"
}

variable "storageaccounttablename" {
    type = "string"
    default = "eiipaasqastoragetable"
}




