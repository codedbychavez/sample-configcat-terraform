terraform {
  required_providers {
    configcat = {
      source = "configcat/configcat",
      version = "~> 1.0"
    }
  }
}

provider "configcat" {
  basic_auth_username = var.configcat_basic_auth_username
  basic_auth_password = var.configcat_basic_auth_password
}