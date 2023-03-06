param location string = resourceGroup().location
param AzureContainerAppEnvName string = 'DeDeACAenv' // see param file !!!

module ContainerAppsNet 'modules/acappsenv-network.bicep' = {
  name: 'ContainerAppsNet'
  params: {
    location: location
  }
}
module ContainerAppsLogs 'modules/acappsenv-logs.bicep' = {
  name: 'ContainerAppsLogs'
  params: {
    location: location
    LogAnalyticsName: 'DeDeACAenvLogs'
  }
}

module ContainerAppsEnv 'modules/acappsenv.bicep' = {
  name: 'ContainerAppsEnv'
  params: {
    location: location
    AzureContainerAppEnvName: AzureContainerAppEnvName
    subnetId: ContainerAppsNet.outputs.subnet1Id
    customerId: ContainerAppsLogs.outputs.customerId
    sharedKey: ContainerAppsLogs.outputs.sharedKey
  }
}
