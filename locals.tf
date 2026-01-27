locals {
	InstanceId = var.InstanceId
	Preamble = "${local.UserLoginTag}-${local.Tag}-${local.Version}-${local.InstanceId}"
	PrivateNetworkSecurityGroupName = "${local.Preamble}-private-nsg"
	PrivateSubnetName = "${local.Preamble}-private-subnet"
	PrivateSubnetPrefix = var.PrivateSubnetPrefix
	PublicHttpSecurityRuleName = "${local.Preamble}-http-rule"
	PublicHttpsSecurityRuleName = "${local.Preamble}-https-rule"
	PublicNetworkSecurityGroupName = "${local.Preamble}-public-nsg"
	PublicSecurityRuleSourceIpPrefixes = var.PublicSecurityRuleSourceIpPrefixes
	PublicSshSecurityRuleName = "${local.Preamble}-ssh-rule"
	PublicSubnetName = "${local.Preamble}-public-subnet"
	PublicSubnetPrefix = var.PublicSubnetPrefix
	ResourceGroupLocation = var.ResourceGroupLocation
	ResourceGroupName = var.ResourceGroupName
	Tag = var.Tag
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	UserProjectTag = var.UserProjectTag
	Version = var.Version
	VnetAddressPrefix = var.VnetAddressPrefix
	VnetName = "${local.Preamble}-vnet"
}