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
    default     =   ["westeurope"]
}

variable "vnet01Name" {
    description = "Web App allowed locations"
    default     =   "vnet01lab"
}