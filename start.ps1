Set-Location -Path 'server-01'
terraform plan
terraform apply -auto-approve

Set-Location -Path '../server-02'
terraform plan
terraform apply -auto-approve

Set-Location -Path '..'

