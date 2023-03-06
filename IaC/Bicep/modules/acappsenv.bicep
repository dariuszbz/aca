param AzureContainerAppEnvName string
param location string = resourceGroup().location
param subnetId string
@secure()
param customerId string
@secure()
param sharedKey string

resource symbolicname 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: AzureContainerAppEnvName
  location: location
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: customerId
        sharedKey: sharedKey
      }
    }
    vnetConfiguration: {
      //dockerBridgeCidr: 'string'
      infrastructureSubnetId: subnetId
      internal: false
      //platformReservedCidr: 'string'
      //platformReservedDnsIP: 'string'
    }
    zoneRedundant: true
  }
}
