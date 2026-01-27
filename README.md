# module-1-vnet-1-public-subnet-1-private-subnet/azurerm

## Description
Terraform module for Vnet deployment on Microsoft Azure

## Deployment
This module creates a topology with a single virtual network having a single public facing subnet and a single private subnet.

## Usage
```tf
module "vnet" {
	source = "git::https://github.com/Keysight/terraform-azurerm-module-1-vnet-1-public-subnet-1-private-subnet.git"
	PublicSecurityRuleSourceIpPrefixes = [ "1.1.1.1/32" ]
	ResourceGroupName = azurerm_resource_group.ResourceGroup.name
}

resource "azurerm_resource_group" "ResourceGroup" {
    location = "East US"
    name = "azure-1-vnet-1-public-subnet-1-private-subnet"
}
```
