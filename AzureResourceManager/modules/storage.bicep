param storageAccountName string
param location string = resourceGroup().location
param unami string
param customerManagedKey string
param keyVaultName string
param containerName string
param whitelistIP array

@description('The storage account has a depency on the key vault for encryption')
resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01'existing = {
  name: keyVaultName
}

@description('The storage account has a depency on the key vault for encryption')
resource cmkKey 'Microsoft.KeyVault/vaults/keys@2023-07-01' existing = {
  parent: keyVault
  name: customerManagedKey
}


@description('Storage account deployment')
resource storageaccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    isHnsEnabled:true
    allowBlobPublicAccess: false
    publicNetworkAccess: 'Disabled'
    networkAcls:{
      defaultAction: 'Deny'
      ipRules: [for ip in whitelistIP: {
        value: ip.adress
        action: 'Allow'
      }]
    }
    encryption:{
      identity:{
        userAssignedIdentity: unami}
      keySource: 'Microsoft.Keyvault'
      keyvaultproperties: {
        keyname: cmkKey.name
        keyvaulturi: keyVault.properties.vaultUri
      }
    }
  }
}

@description('Blob services in storage account')
resource Blob 'Microsoft.Storage/storageAccounts/blobServices@2023-05-01' = {
  parent:storageaccount
  name: 'default'
}

@description('Deploy container in the storage account')
resource Container 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = {
  name: containerName
  
}




