# Disable anonymous blob/container public read at the account level
az storage account update \
  --name <storageAccount> \
  --resource-group <rg> \
  --allow-blob-public-access false

# (Optional) confirm property
az storage account show -n <storageAccount> -g <rg> --query "allowBlobPublicAccess"
