param location string = resourceGroup().location
param AzureContainerAppEnvName string = 'debe-test'

module ContainerAppsNet 'modules/acappsenv-network.bicep' = {
  name: 'ContainerAppsNet'
  params: {
    location: location
  }
}
module ContainerAppsEnv 'modules/acappsenv.bicep' = {
  name: 'ContainerAppsEnv'
  params: {
    location: location
    AzureContainerAppEnvName: AzureContainerAppEnvName
    subnetId: ContainerAppsNet.outputs.subnet1Id
  }
}
