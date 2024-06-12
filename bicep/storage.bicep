param storageAccountName string
param location string

resource storage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource blob 'Microsoft.Storage/storageAccounts/blobServices@2022-09-01' = {
  name: 'default'
  parent: storage
  properties: {
    changeFeed: {
      enabled: true
      retentionInDays: 30
    }
    containerDeleteRetentionPolicy: {
      allowPermanentDelete: false
      days: 120  
      enabled: true
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      days: 120
      enabled: true
    }
    isVersioningEnabled: false 
  }
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' =  {
  parent: blob
  name: 'tfstates'
  properties: {
    publicAccess: 'None'
    metadata: {}
  }
}
