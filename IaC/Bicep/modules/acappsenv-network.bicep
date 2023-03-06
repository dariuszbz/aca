param vnetName string = 'acappsenv-vnet10-0-16'
param vnetRange array = ['10.0.0.0/16']

param vnetInfraSnetName1 string = 'acappsenv-vnet-infraSnet2-23'
param vnetInfraSnetRange1 string = '10.0.2.0/23'

param vnetInfraSnetName2 string = 'acappsenv-vnet-infraSnet4-23'
param vnetInfraSnetRange2 string = '10.0.4.0/23'

param location string = resourceGroup().location

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: vnetName
  location: location

  properties: {
    addressSpace: {
      addressPrefixes: vnetRange
    }
  subnets: [
    {
      name: vnetInfraSnetName1
      properties: {
        addressPrefix: vnetInfraSnetRange1
      }
    }
    {
      name: vnetInfraSnetName2
      properties: {
        addressPrefix: vnetInfraSnetRange2
      }
    }
  ]
  }
}
output subnet1Id string = virtualNetwork.properties.subnets[0].id
output subnet2Id string = virtualNetwork.properties.subnets[1].id
