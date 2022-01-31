param pAppServicePlan string
param pWebAppService string
param pInstrumentationKey string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: pAppServicePlan
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
  }
}

resource azbicepappservice 'Microsoft.Web/sites@2018-11-01' = {
  name: pWebAppService
  location: resourceGroup().location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', appServicePlan.name)
  }
}

resource azbicepappsettings 'Microsoft.Web/sites/config@2021-02-01' = {
  name: 'web'
  parent: azbicepappservice
  properties: {
    appSettings: [
      {
        name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: pInstrumentationKey
      }
    ]
  }
}
