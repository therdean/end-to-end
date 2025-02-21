Set-Location -Path 'server-01'
terraform destroy -auto-approve

Set-Location -Path '../server-02'
terraform destroy -auto-approve

Set-Location -Path '..'
