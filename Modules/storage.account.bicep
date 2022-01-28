targetScope = 'resourceGroup'
param Location string = resourceGroup().location
param tagValues object

// Params for Storage Configuration Set which will be applied in resources.bicep under StorageModule
param storageAccountName string
param storageSKU object
param storageKind string
param storageMinimumTlsVersion string
param storagesupportsHttpsTrafficOnly bool
param storageNetworkAclAllow string
param storageNetworkAclBypass string
param blobRestore bool
param blobContainerDeleteRetentionPolicy bool
param blobDeleteRetentionPolicy bool
param fileServicesRetention bool



resource storageAccountResource 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: Location
  tags: tagValues
  sku: storageSKU
  kind: storageKind
  properties: {
    allowCrossTenantReplication: true
    minimumTlsVersion: storageMinimumTlsVersion
    allowBlobPublicAccess: true
    allowSharedKeyAccess: true
    networkAcls: {
      bypass: storageNetworkAclBypass
      defaultAction: storageNetworkAclAllow
    }
    supportsHttpsTrafficOnly: storagesupportsHttpsTrafficOnly
    encryption: {
      services: {
        file: {
          keyType: 'Account'	
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
      }
      accessTier: 'Hot'
  }
  identity:{
    type: 'SystemAssigned' 
  }
  resource staBlobResource 'blobServices@2021-06-01' = {
    name: 'default'
    properties: {
     cors: {
       corsRules: [
         {
           allowedOrigins:[
              '*'
           ]
           allowedHeaders:[
              '*'  
           ]
           allowedMethods:[
             'GET'
             'OPTIONS'
           ]
           exposedHeaders: [
             '*'
           ]
           maxAgeInSeconds: 0
         }
       ]
     }
      changeFeed: {
        enabled: true
      }
      restorePolicy: {
        enabled: blobRestore
      }
      containerDeleteRetentionPolicy: {
        enabled: blobContainerDeleteRetentionPolicy
        days: 7
      }
      deleteRetentionPolicy: {
        enabled: blobDeleteRetentionPolicy
        days: 7
      }
      isVersioningEnabled: false
    }
    resource staContainerResource 'containers@2021-06-01' = {
      name: 'html'
      properties: {
        immutableStorageWithVersioning: {
          enabled: false
        }
        defaultEncryptionScope: '$account-encryption-key'
        denyEncryptionScopeOverride: false
        publicAccess: 'Blob'
      }
    }
  }
  resource staFileservicesResource 'fileServices@2021-06-01' = {
    name: 'default'
    properties: {
      shareDeleteRetentionPolicy: {
        enabled: fileServicesRetention
        days: 7
      }
    }
  }
  resource staqueueResource 'queueServices@2021-06-01' = {
    name: 'default'
   }
  resource statableRecource 'tableServices@2021-06-01' = {
    name: 'default'
  }

}



// Output
output staNAME string = storageAccountResource.name
output staID string = storageAccountResource.id
output staAPIversion string = storageAccountResource.apiVersion
