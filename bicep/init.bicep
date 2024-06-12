targetScope = 'resourceGroup'

param location string = resourceGroup().location
param environment string

module st './storage.bicep' = {
  name: 'infrastructureStates'
  scope: resourceGroup()   // Deployed in the scope of resource group we created above
  params: {
    storageAccountName: 'project${environment}'
    location: location
  }
}
