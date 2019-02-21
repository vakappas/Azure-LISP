# Deploy lab
url=https://raw.githubusercontent.com/vakappas/Azure-LISP/two-subnets/lisp_lab_iterate_through_vnet.json

rg=lisp-lab-dev
az group create -n $rg -l westeurope
az group deployment create -g $rg --template-uri $url --parameters '{"adminPassword":{"value":"P@ssw0rd@2019"}}'

# Check Public IP addresses
az network public-ip list -g $rg --query [].[name,ipAddress] -o tsv

# Cleanup
az group delete -n $rg -y --no-wait
