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
  name                = "plan-free-${var.region}"
  location            = "${var.region}"
  resource_group_name = "${azurerm_resource_group.rg01.name}"
  tags                = "${azurerm_resource_group.rg01.tags}"

  kind = "Linux"

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "citadel" {
  name                = "webapp-${random_string.webapprnd.result}-${var.region}"
  location            = "${var.region}"
  resource_group_name = "${azurerm_resource_group.rg01.name}"
  tags                = "${azurerm_resource_group.rg01.tags}"

  app_service_plan_id = "${azurerm_app_service_plan.free.id}"
}
