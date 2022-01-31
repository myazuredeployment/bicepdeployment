param pAppServicePlan string = 'azbicep-prod-cindia-appserviceplan'
param pWebAppService string = 'azbicep-prod-cindia-webappservice'
param pAppInsights string = 'azbicep-prod-cindia-appinsights'
param pSQLServer string = 'azbicep-prod-cindia-sqlserver'
param pSQLServerDatabase string = 'azbicep-prod-cindia-sqlserverdatabase'

module AppServicePlan 'AppServicePlan.bicep' = {
  name: 'AppServicePlan'
  params:{
    pWebAppService: pWebAppService
    pInstrumentationKey: AppInsights.outputs.oInstrumentationKey
    pAppServicePlan: pAppServicePlan
  }
}

module AppInsights 'AppInsights.bicep' = {
  name: 'AppInsights'
  params:{
    pAppInsights: pAppInsights
  }
}

module SQLDatabase 'SQLDatabase.bicep' = {
  name: 'SQLDatabase'
  params:{
    pSQLServerDatabase: pSQLServerDatabase
    pSQLServer: pSQLServer
  }
}
