
module dwh_storage 'modules/storage.bicep' = {
  name: 'module_dwh_storage'
  params: {
    location: location
    keyVaultName: keyVaultName
    keyVaultKeyName: keyVaultKeyNameStorage
    storageAccountName: storageAccountName
    storageBlobContainerName: storageBlobContainerName
    storageBlobContainerSensitiveName: storageBlobContainerSensitiveName
    storageBlobContainerConfigName: storageBlobContainerConfigName
    environmentType: environmentType
    environmentConfigurationMap: environmentConfigurationMap
    ipAllowed: ipAllowed
    uamiName: uamiName
  }
  dependsOn: [
    keyvault
  ]  
}