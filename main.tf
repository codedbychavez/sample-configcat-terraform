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

data "configcat_organizations" "my_organizations" {

}
resource "configcat_product" "my_product" {
  organization_id = data.configcat_organizations.my_organizations.organizations.0.organization_id
  name = "My product"
  description = "My example product"
}

resource "configcat_environment" "my_environment" {
  product_id = configcat_product.my_product.id
  name = "Production"
  description = "The production environment"
  color = "blue"
}

resource "configcat_config" "my_config" {
  product_id = configcat_product.my_product.id
  name = "My config"
  description = "My example config"
}

resource "configcat_setting" "is_awesome" {
  config_id = configcat_config.my_config.id
  key = "isMyAwesomeFeatureEnabled"
  name = "My awesome feature flag"
  hint = "this is the hint for my awesome feature flag"
  setting_type = "boolean"
}
