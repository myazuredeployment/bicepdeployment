targetScope = 'subscription'

resource azbicepresourcegroup_dev 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'azbicep-dev-cindia-rg'
  location: 'centralindia'
}
