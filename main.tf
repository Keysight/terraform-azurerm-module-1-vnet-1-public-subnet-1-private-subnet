resource "azurerm_virtual_network" "Vnet" {
	name = local.VnetName
	location = local.ResourceGroupLocation
	resource_group_name = local.ResourceGroupName
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		ResourceGroup = local.ResourceGroupName
		Location = local.ResourceGroupLocation
	}
	address_space = [ local.VnetAddressPrefix ]
}

resource "azurerm_subnet" "PublicSubnet" {
	name = local.PublicSubnetName
	resource_group_name = local.ResourceGroupName
	virtual_network_name = azurerm_virtual_network.Vnet.name
	address_prefixes = [ local.PublicSubnetPrefix ]
	depends_on = [
		azurerm_virtual_network.Vnet
	]
}

resource "azurerm_subnet" "PrivateSubnet" {
	name = local.PrivateSubnetName
	resource_group_name = local.ResourceGroupName
	virtual_network_name = azurerm_virtual_network.Vnet.name
	address_prefixes = [ local.PrivateSubnetPrefix ]
	depends_on = [
		azurerm_virtual_network.Vnet
	]
}

resource "azurerm_network_security_group" "PublicNetworkSecurityGroup" {
	name = local.PublicNetworkSecurityGroupName
	location = local.ResourceGroupLocation
	resource_group_name = local.ResourceGroupName
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		ResourceGroup = local.ResourceGroupName
		Location = local.ResourceGroupLocation
	}
	security_rule {
		name = local.PublicHttpsSecurityRuleName
		description = "Allow HTTPS"
		protocol = "Tcp"
		source_port_range = "*"
		destination_port_range = "443"
		destination_address_prefix = "*"
		access = "Allow"
		priority = 100
		direction = "Inbound"
		source_address_prefixes = local.PublicSecurityRuleSourceIpPrefixes
		destination_address_prefixes = []
	}
	security_rule {
		name = local.PublicSshSecurityRuleName
		description = "Allow SSH"
		protocol = "Tcp"
		source_port_range = "*"
		destination_port_range = "22"
		destination_address_prefix = "*"
		access = "Allow"
		priority = 101
		direction = "Inbound"
		source_address_prefixes = local.PublicSecurityRuleSourceIpPrefixes
		destination_address_prefixes = []
	}
	security_rule {
		name = local.PublicHttpSecurityRuleName
		description = "Allow HTTP"
		protocol = "Tcp"
		source_port_range = "*"
		destination_port_range = "80"
		destination_address_prefix = "*"
		access = "Allow"
		priority = 102
		direction = "Inbound"
		source_address_prefixes = local.PublicSecurityRuleSourceIpPrefixes
		destination_address_prefixes = []
	}
} 

resource "azurerm_subnet_network_security_group_association" "PublicNetworkSecurityGroup" {
	subnet_id = azurerm_subnet.PublicSubnet.id
	network_security_group_id = azurerm_network_security_group.PublicNetworkSecurityGroup.id
}

resource "azurerm_network_security_group" "PrivateNetworkSecurityGroup" {
	name = local.PrivateNetworkSecurityGroupName
	location = local.ResourceGroupLocation
	resource_group_name = local.ResourceGroupName
	tags = {
		Owner = local.UserEmailTag
		Project = local.UserProjectTag
		ResourceGroup = local.ResourceGroupName
		Location = local.ResourceGroupLocation
	}
}

resource "azurerm_subnet_network_security_group_association" "PrivateNetworkSecurityGroup" {
	subnet_id = azurerm_subnet.PrivateSubnet.id
	network_security_group_id = azurerm_network_security_group.PrivateNetworkSecurityGroup.id
}