resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' existing = {
  name: uamiName
}

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    enabledForDeployment: false
    enabledForDiskEncryption: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
    enablePurgeProtection: true

    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: [for ip in ipAllowed: {
        value: ip.startIpAddress
      }]
    }
    enabledForTemplateDeployment: true
    enableRbacAuthorization: true
    sku:{
      name: 'standard'
      family: 'A'
    }
    tenantId: tenant().tenantId
  }
}
