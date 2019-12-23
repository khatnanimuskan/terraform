
variable "Resource_Group" {
    type ="string"
    default = "EI-iPaaS-QA-RG"
  
}
variable "location" {
    type ="string"
    default = "westus2"
  
}
variable "functionapp_storage" {
    type ="string"
    default = "eiipaasqafunctionappsa"
  
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
    type = "string"
   # default = "EI-iPaaS-QA-Function-App"
}