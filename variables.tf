variable "region" {
    description = "Default Azure region"
    default     =   "northeurope"
}

variable "tags" {
    default     = {
        source  = "citadel"
        env     = "training"
    }
}
variable "webapplocs" {
    description = "Web App allowed locations"
    default     =   [ "eastus2", "uksouth", "northeurope" ]
}