provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version         = "1.23.0"
  subscription_id = "a822836f-a295-4355-8b42-3f8d950e4e10"
  tenant_id       = "dfe2b6f0-2602-4e7e-aedb-56ee085dd161"
  client_id       = "7c61752f-8f3c-4513-be41-fcdd33ba64de"
  client_secret   = "d2f37480-d3dc-4db5-8017-a981892c0506"
}