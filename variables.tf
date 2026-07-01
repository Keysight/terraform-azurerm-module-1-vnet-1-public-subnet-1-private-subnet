variable "InstanceId" {
	default = "vnet"
	description = "Id of the instance of this module that ensures uniqueness"
	type = string
}

variable "PrivateSubnetPrefix" {
	default = "10.0.2.0/24"
	description = "IP CIDR range allocated to the private subnet"
	type = string
}

variable "PublicSecurityRuleSourceIpPrefixes" {
	description = "List of IP Addresses /32 or IP CIDR ranges connecting inbound to App"
	type = list(string)
}

variable "PublicSubnetPrefix" {
	default = "10.0.10.0/24"
	description = "IP CIDR range allocated to the public subnet"
	type = string
}

variable "ResourceGroupLocation" {
	default = "East US"
	description = "Location of container metadata and control plane operations"
	type = string
}

variable "ResourceGroupName" {
	description = "Id of container that holds related resources that you want to manage together"
	type = string
}

variable "Tag" {
	default = "azure"
	description = "App ID tag of application using the deployment"
	type = string
}

variable "UserEmailTag" {
	default = "terraform@example.com"
	description = "Email address tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	default = "terraform"
	description = "Login ID tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "UserProjectTag" {
	default = "module"
	description = "Project tag of user creating the deployment"
	type = string
}

variable "Version" {
	default = "26.1.0"
	description = "Versioning of the application using the deployment"
	type = string
}

variable "VnetAddressPrefix" {
	default = "10.0.0.0/16"
	type = string
}
