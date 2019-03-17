resource "azurerm_resource_group" "rg01" {
  name     = "webapps"
  location = "${var.region}"
  tags     = "${var.tags}"
}

resource "random_string" "webapprnd" {
  length  = 8
  lower   = true
  number  = true
  upper   = false
  special = false
}

resource "azurerm_app_service_plan" "free" {
  name                = "plan-free-${var.webapplocs[count.index]}"
  count               = "${length(var.webapplocs)}"
  location            = "${var.webapplocs[count.index]}"
  resource_group_name = "${azurerm_resource_group.rg01.name}"
  tags                = "${azurerm_resource_group.rg01.tags}"

  kind = "Linux"

  sku {
    tier = "Free"
    size = "F1"
  }
  
}

resource "azurerm_app_service" "citadel" {
  name                = "webapp-${random_string.webapprnd.result}-${var.webapplocs[count.index]}"
  count               = "${length(var.webapplocs)}"
  location            = "${var.webapplocs[count.index]}"
  resource_group_name = "${azurerm_resource_group.rg01.name}"
  tags                = "${azurerm_resource_group.rg01.tags}"

  app_service_plan_id = "${element(azurerm_app_service_plan.free.*.id, count.index)}"
}
output "webapp_ids" {
  description = "ids of the webapps provisoned."
  value       = "${azurerm_app_service.citadel.*.id}"
}
