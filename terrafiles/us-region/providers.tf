terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id   = "b66ccd79-687e-4d63-b9b6-3119d74bad77"
  tenant_id         = "274102ec-cd24-4af2-a4c2-832941ce526f"
  client_id         = "5bedfe60-331a-4f79-aef5-ceefe4bf6902"
  client_secret     = "znt8Q~Chi5J6-k~F2TLa49Gjrxx6xocQl1BMTcpt"
}