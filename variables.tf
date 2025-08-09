variable "resource_group_name"{
	description = "Name of the resource group"
	type = string
	default = "function-app"
}

variable "function_app_name"{
	description = "Name of the function app"
	type = string
	default = "funapp-linux-function-app"
}

variable "storage_account_name"{
	description = "Name of the storage account" 
	type = string
	default = "linuxfunctionappsa"
}

variable "service_plan_name"{
	desciption = "Name of the service plan"
	type = string
	default = "function-app-service-plan"
}
