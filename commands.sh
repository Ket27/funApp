# Login to the azure portal of suitable subscription
az login

# Essential commands of terraform to get executed
terraform init

terraform plan

terraform apply -auto-approve

# Link the function app to the code logic of your node backend
func azure functionapp publish $(terraform output -raw functions_app_name)
