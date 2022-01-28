var EnvironmentConfigurationMap = {
  AzureDEV: {
    ST: {
      sku: {
        name: 'Standard_LRS'
      }
      kind: 'StorageV2'
      properties: {
        minimumTlsVersion: 'TLS1_2'
        supportsHttpsTrafficOnly: true
        networkAcls: {
          bypass: 'AzureServices'
          defaultAction: 'Allow'
        }
      }
    }
    STBLOB : {
      properties: {
        restorePolicy: {
          enabled: false
        }
        containerDeleteRetentionPolicy: {
          enabled: false
          days: 7
        }
        deleteRetentionPolicy: {
          enabled: false
          days: 7
        }
      }
    }
    STFILE: {
      properties: {
        shareDeleteRetentionPolicy:{
          enabled: false
        }
      }
    }
  }
  AzureTST: {
    ST: {
      sku: {
        name: 'Standard_RAGRS'
      }
      kind: 'StorageV2'
      properties: {
        minimumTlsVersion: 'TLS1_2'
        supportsHttpsTrafficOnly: true
        networkAcls: {
          bypass: 'AzureServices'
          defaultAction: 'Allow'
        }
      }
    }
    STBLOB : {
      properties: {
        restorePolicy: {
          enabled: false
        }
        containerDeleteRetentionPolicy: {
          enabled: false
          days: 7
        }
        deleteRetentionPolicy: {
          enabled: false
          days: 7
        }
      }
    }
    STFILE: {
      properties: {
        shareDeleteRetentionPolicy:{
          enabled: false
        }
      }
    }
  }
  AzureACC: {
    ST: {
      sku: {
        name: 'Standard_RAGZRS'
      }
      kind: 'StorageV2'
      properties: {
        minimumTlsVersion: 'TLS1_2'
        supportsHttpsTrafficOnly: true
        networkAcls: {
          bypass: 'AzureServices'
          defaultAction: 'Deny'
        }
      }
    }
    STBLOB : {
      properties: {
        restorePolicy: {
          enabled: false
        }
        containerDeleteRetentionPolicy: {
          enabled: true
          days: 7
        }
        deleteRetentionPolicy: {
          enabled: true
          days: 7
        }
      }
    }
    STFILE: {
      properties: {
        shareDeleteRetentionPolicy:{
          enabled: true
        }
      }
    }
  }
  AzurePRD: {
    ST: {
      sku: {
        name: 'Standard_RAGZRS'
      }
      kind: 'StorageV2'
      properties: {
        minimumTlsVersion: 'TLS1_2'
        supportsHttpsTrafficOnly: true
        networkAcls: {
          bypass: 'AzureServices'
          defaultAction: 'Deny'
        }
      }
    }
    STBLOB : {
      properties: {
        restorePolicy: {
          enabled: false
        }
        containerDeleteRetentionPolicy: {
          enabled: true
          days: 7
        }
        deleteRetentionPolicy: {
          enabled: true
          days: 7
        }
      }
    }
    STFILE: {
      properties: {
        shareDeleteRetentionPolicy:{
          enabled: true
        }
      }
    }
  }
}

output config object = EnvironmentConfigurationMap
