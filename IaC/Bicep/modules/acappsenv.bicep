param AzureContainerAppEnvName string
param location string = resourceGroup().location
param subnetId string

resource symbolicname 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: AzureContainerAppEnvName
  location: location
  properties: {
    // appLogsConfiguration: {
    //   destination: 'string'
    //   logAnalyticsConfiguration: {
    //     customerId: 'string'
    //     sharedKey: 'string'
    //   }
    // }
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
