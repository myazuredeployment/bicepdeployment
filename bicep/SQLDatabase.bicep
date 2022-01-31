param pSQLServer string
param pSQLServerDatabase string

resource azbicepsqlserver 'Microsoft.Sql/servers@2014-04-01' ={
  name: pSQLServer
  location: resourceGroup().location
  properties:{
    administratorLogin: 'sqladmin'
    administratorLoginPassword: 'Test@12345'
  }
}

resource sqlServerFirewallRules 'Microsoft.Sql/servers/firewallRules@2020-11-01-preview' = {
  parent: azbicepsqlserver
  name: 'My IP Address'
  properties: {
    startIpAddress: '1.1.1.1'
    endIpAddress: '1.1.1.1'
  }
}

resource azbicepsqlServerDb 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: azbicepsqlserver
  name: pSQLServerDatabase
  location: resourceGroup().location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: '34359738368'
  }
}
