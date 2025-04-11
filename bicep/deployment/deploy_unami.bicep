module uami 'modules/uami.bicep' = {
  name: 'module_nad_uami'
  params: {
    location: location
    environmentType: environmentType
    uamiName: uamiName
  }
}