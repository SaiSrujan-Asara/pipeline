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

  subscription_id   = "94048a12-158f-41ff-b6bf-1b48f47bf344"
  tenant_id         = "274102ec-cd24-4af2-a4c2-832941ce526f"
  client_id         = "0a999f6c-e57b-41d5-9502-e96cba9a3be6"
  client_secret     = "B628Q~XTTsqf8TEn7uxg2ke1I8RRoBLsSVsZhaWZ"
}