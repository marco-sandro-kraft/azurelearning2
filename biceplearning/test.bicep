

@minLength(3)
@maxLength(24)
param storageAccountname string

@allowed([
  'Standard_LRS'
  'Standard_ZRS'
])
param storageAccountSku string = 'Standard_LRS'

param storageaccountag object ={
  environment: 'lab'
  department: 'IT'

}


resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountname
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: storageAccountSku
  }
  tags: storageaccountag
}
