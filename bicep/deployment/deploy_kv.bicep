module keyvault 'modules/keyvault.bicep' = {
  name: keyVaultName
  params: {
    location: location
    environmentType: environmentType
    keyVaultName: keyVaultName
    keyVaultKeyNameStorage: keyVaultKeyNameStorage
    keyVaultKeyNameProductStorage: keyVaultKeyNameProductStorage
    keyVaultKeyNameOpenStorage: keyVaultKeyNameOpenStorage
    ipAllowed: ipAllowed
    roleDefinition: roleDefinition
    administrator_keyvault: aadDataWarehouseSynapseGroups.SynapseAdministrator[environmentType].objectId
    DevOpsServicePrincipal: DevOpsServicePrincipal[environmentType].objectId
    uamiName: uamiName
  }
  dependsOn: [
    uami
  ]
}