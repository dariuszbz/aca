param LogAnalyticsName string = 'DeDeACAenvLogs'
param location string = resourceGroup().location

resource LogAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: LogAnalyticsName
  location: location
}

output customerId string = LogAnalytics.properties.customerId
var primaryKey = listKeys(LogAnalytics.id, LogAnalytics.apiVersion).primarySharedKey
output sharedKey string = primaryKey
