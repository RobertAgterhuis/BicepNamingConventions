targetScope= 'subscription'
param TenantId string = tenant().tenantId   // This param is needed for the KeyVault Configuration Settings


var EnvironmentConfigurationMap = {
  AzureDEV:{
    MANDATORY:{
      Location: 'westeurope'
      LockLevel: 'CanNotDelete'
    }
    GENERAL:{
      APIM: {
        properties: {}
      }
      ID: {
  
      }
      MG: {
  
      }
      POLICY:{
  
      }
      RG:{
  
      }

    }
    NETWORKING:{

      AGW: {
        properties: {}
      }
      ASG: {
  
      }
      BAS:{
  
      }
      CDNP: {
  
      }
      CDNE:{
  
      }
      CON:{
  
      }
      DNSZ:{
  
      }
      PDNSZ:{
  
      }
      AFW:{
  
      }
      AFWP:{
  
      }
      ERC: {
  
      }
      FD:{
  
      }
      FDFP:{
  
      }
      LBI:{
  
      }
      LBE:{
  
      }
      RULE:{
  
      }
      LGW:{
  
      }
      NG:{
  
      }
      NIC:{
  
      }
      NSG:{
  
      }
      NSGSR:{
  
      }
      NW:{
  
      }
      PL:{
  
      }
      PIP:{
  
      }
      IPPRE:{
  
      }
      RF:{
  
      }
      RT:{
  
      }
      SE:{
  
      }
      TRAF:{
  
      }
      UDR:{
  
      }
      VNET:{
  
      }
      PEER:{
  
      }
      SNET:{
  
      }
      VWAN:{
  
      }
      VPNG:{
  
      }
      VCN: {
  
      }
      VST:{
  
      }
      VGW:{
  
      }
      WAF:{
  
      }
      WAGRG:{
  
      }
    }
    COMPUTEWEB:{
      ASE: {
        properties: {}
      }
      PLANWINF1:{
        kind: 'Windows'
        sku: {
          name: 'F1'
          tier: 'Free'
          size: 'F1'
          family: 'F'
          capacity: 0
        }
        properties:{
          perSiteScaling: false
          elasticScaleEnabled: false
          maximumElasticWorkerCount: 1
          isSpot: false
          reserved: false
          isXenon: false
          hyperV: false
          targetWorkerCount: 0
          targetWorkerSizeId: 0
          zoneRedundant: false
        }
      }
      PLANWIN: {
  
      }
      PLANLIN:{
  
      }
      AVAIL:{
  
      }
      ARCS:{
  
      }
      ARCK:{
  
      }
      CLD:{
  
      }
      DES:{
  
      }
      FUNC:{
  
      }
      GAL:{
  
      }
      OSDISK:{
  
      }
      DIKS:{
  
      }
      NTF:{
  
      }
      NTFNS:{
  
      }
      SNAP:{
  
      }
      STAPP:{
  
      }
      VM:{
  
      }
      VMSS:{
  
      }
      STVM:{
  
      }
      APP:{
        mandatory:{
          siteConfig:{
            http20Enabled: true
            minTlsversion: '1.2'
            scmMinTlsVersion: '1.2'
            ftpsState: 'Disabled'
            ipSecurityRestrictions:[
              {
                ipAddress: ' Any'
                action: 'Allow'
                priority: 1
                name: 'Allow all'
                description: ' Allow all access'
              }
            ]
            scmIpSecurityRestrictions: [
              {
                  ipAddress: 'Any'
                  action: 'Allow'
                  priority: 1
                  name: 'Allow all'
                  description: 'Allow all access'
              }
          ]
          }
          httpsOnly: true        
        }
      }

    }
    CONTAINERS:{
      AKS: {
        properties: {}
      }
      CR:{
  
      }
      CI:{
  
      }
      SF:{
  
      }

    }
    DATABASES:{
      COSMOS: {
        properties: {}
      }
      REDIS: {
  
      }
      SQL:{
  
      }
      SQLDB:{
  
      }
      SYN:{
  
      }
      SYNW:{
  
      }
      SYNDP:{
  
      }
      SYNSP:{
  
      }
      MYSQL:{
  
      }
      PSQL:{
  
      }
      SQLSTRDB:{
  
      }
      SQLMI:{
  
      }

    }
    STORAGE:{
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
    AIMACHINE:{
      SRCH: {
        properties: {}
      }
      COG:{
  
      }
      MLW:{
  
      }

    }
    ANALYTICSIOT:{
      AS: {
        properties: {}
      }
      DBW:{
  
      }
      ASA:{
  
      }
      DEC:{
  
      }
      DEDB:{
  
      }
      ADF:{
  
      }
      DLS:{
  
      }
      DLA:{
  
      }
      EVHNS:{
  
      }
      EVH:{
  
      }
      EVGD:{
  
      }
      EVGS:{
  
      }
      EVGT:{
  
      }
      HADOOP:{
  
      }
      HBASE:{
  
      }
      KAFKA:{
  
      }
      SPARK:{
  
      }
      STORM:{
  
      }
      MLS:{
  
      }
      IOT:{
  
      }
      PROVS:{
  
      }
      PCERT:{
  
      }
      PBI:{
  
      }
      TSI:{
  
      }

    }
    AVD:{
      VDPOOL: {
        properties: {}
      }
      VDAG:{
  
      }
      VDWS:{
  
      }

    }
    DEVELOPER:{
      APPCS: {
        properties: {}
      }
      SIGR:{
  
      }

    }
    INTEGRATION:{
      IA: {
        properties: {}
      }
      LOGIC:{
  
      }
      SB:{
  
      }
      SBQ:{
  
      }
      SBT:{
        
      }

    }
    MANGOV:{
      KV: {
        properties: {
          sku:{
            family: 'A'
            name: 'standard'
          }
          tenantId: TenantId
          softDeleteRetentionInDays: 7
          enableSoftDelete: false
          enabledForDeployment: true
          enabledForTemplateDeployment: true
          enabledForDiskEncryption: true
          enableRbacAuthorization: false
          networkAcls: {
            bypass: 'AzureServices'
            defaultAction: 'Allow'
          }
        }
      }
      LOG: {
  
      }
      BPA: {
  
      }
      BP: {
  
      }
      PVIEW:{
  
      }
      AG: {
  
      }
      APPI: {
  
      }
      AA:{
  
      }

    }
    MIGRATION:{
      MIGR: {
        properties: {}
      }
      DMS:{
  
      }
      RSV:{
        
      }

    }
  }
  AzureTST:{
    MANDATORY:{
      Location: 'westeurope'
      LockLevel: 'CanNotDelete'
    }
    GENERAL:{
      APIM: {
        properties: {}
      }
      ID: {
  
      }
      MG: {
  
      }
      POLICY:{
  
      }
      RG:{
  
      }

    }
    NETWORKING:{

      AGW: {
        properties: {}
      }
      ASG: {
  
      }
      BAS:{
  
      }
      CDNP: {
  
      }
      CDNE:{
  
      }
      CON:{
  
      }
      DNSZ:{
  
      }
      PDNSZ:{
  
      }
      AFW:{
  
      }
      AFWP:{
  
      }
      ERC: {
  
      }
      FD:{
  
      }
      FDFP:{
  
      }
      LBI:{
  
      }
      LBE:{
  
      }
      RULE:{
  
      }
      LGW:{
  
      }
      NG:{
  
      }
      NIC:{
  
      }
      NSG:{
  
      }
      NSGSR:{
  
      }
      NW:{
  
      }
      PL:{
  
      }
      PIP:{
  
      }
      IPPRE:{
  
      }
      RF:{
  
      }
      RT:{
  
      }
      SE:{
  
      }
      TRAF:{
  
      }
      UDR:{
  
      }
      VNET:{
  
      }
      PEER:{
  
      }
      SNET:{
  
      }
      VWAN:{
  
      }
      VPNG:{
  
      }
      VCN: {
  
      }
      VST:{
  
      }
      VGW:{
  
      }
      WAF:{
  
      }
      WAGRG:{
  
      }
    }
    COMPUTEWEB:{
      ASE: {
        properties: {}
      }
      PLANWINF1:{
        kind: 'Windows'
        sku: {
          name: 'F1'
          tier: 'Free'
          size: 'F1'
          family: 'F'
          capacity: 0
        }
        properties:{
          perSiteScaling: false
          elasticScaleEnabled: false
          maximumElasticWorkerCount: 1
          isSpot: false
          reserved: false
          isXenon: false
          hyperV: false
          targetWorkerCount: 0
          targetWorkerSizeId: 0
          zoneRedundant: false
        }
      }
      PLANWIN: {
  
      }
      PLANLIN:{
  
      }
      AVAIL:{
  
      }
      ARCS:{
  
      }
      ARCK:{
  
      }
      CLD:{
  
      }
      DES:{
  
      }
      FUNC:{
  
      }
      GAL:{
  
      }
      OSDISK:{
  
      }
      DIKS:{
  
      }
      NTF:{
  
      }
      NTFNS:{
  
      }
      SNAP:{
  
      }
      STAPP:{
  
      }
      VM:{
  
      }
      VMSS:{
  
      }
      STVM:{
  
      }
      APP:{
        mandatory:{
          siteConfig:{
            http20Enabled: true
            minTlsversion: '1.2'
            scmMinTlsVersion: '1.2'
            ftpsState: 'Disabled'
            ipSecurityRestrictions:[
              {
                ipAddress: ' Any'
                action: 'Allow'
                priority: 1
                name: 'Allow all'
                description: ' Allow all access'
              }
            ]
            scmIpSecurityRestrictions: [
              {
                  ipAddress: 'Any'
                  action: 'Allow'
                  priority: 1
                  name: 'Allow all'
                  description: 'Allow all access'
              }
          ]
          }
          httpsOnly: true        
        }
      }

    }
    CONTAINERS:{
      AKS: {
        properties: {}
      }
      CR:{
  
      }
      CI:{
  
      }
      SF:{
  
      }

    }
    DATABASES:{
      COSMOS: {
        properties: {}
      }
      REDIS: {
  
      }
      SQL:{
  
      }
      SQLDB:{
  
      }
      SYN:{
  
      }
      SYNW:{
  
      }
      SYNDP:{
  
      }
      SYNSP:{
  
      }
      MYSQL:{
  
      }
      PSQL:{
  
      }
      SQLSTRDB:{
  
      }
      SQLMI:{
  
      }

    }
    STORAGE:{
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
    AIMACHINE:{
      SRCH: {
        properties: {}
      }
      COG:{
  
      }
      MLW:{
  
      }

    }
    ANALYTICSIOT:{
      AS: {
        properties: {}
      }
      DBW:{
  
      }
      ASA:{
  
      }
      DEC:{
  
      }
      DEDB:{
  
      }
      ADF:{
  
      }
      DLS:{
  
      }
      DLA:{
  
      }
      EVHNS:{
  
      }
      EVH:{
  
      }
      EVGD:{
  
      }
      EVGS:{
  
      }
      EVGT:{
  
      }
      HADOOP:{
  
      }
      HBASE:{
  
      }
      KAFKA:{
  
      }
      SPARK:{
  
      }
      STORM:{
  
      }
      MLS:{
  
      }
      IOT:{
  
      }
      PROVS:{
  
      }
      PCERT:{
  
      }
      PBI:{
  
      }
      TSI:{
  
      }

    }
    AVD:{
      VDPOOL: {
        properties: {}
      }
      VDAG:{
  
      }
      VDWS:{
  
      }

    }
    DEVELOPER:{
      APPCS: {
        properties: {}
      }
      SIGR:{
  
      }

    }
    INTEGRATION:{
      IA: {
        properties: {}
      }
      LOGIC:{
  
      }
      SB:{
  
      }
      SBQ:{
  
      }
      SBT:{
        
      }

    }
    MANGOV:{
      KV: {
        properties: {
          sku:{
            family: 'A'
            name: 'standard'
          }
          tenantId: TenantId
          softDeleteRetentionInDays: 7
          enableSoftDelete: false
          enabledForDeployment: true
          enabledForTemplateDeployment: true
          enabledForDiskEncryption: true
          enableRbacAuthorization: false
          networkAcls: {
            bypass: 'AzureServices'
            defaultAction: 'Allow'
          }
        }
      }
      LOG: {
  
      }
      BPA: {
  
      }
      BP: {
  
      }
      PVIEW:{
  
      }
      AG: {
  
      }
      APPI: {
  
      }
      AA:{
  
      }

    }
    MIGRATION:{
      MIGR: {
        properties: {}
      }
      DMS:{
  
      }
      RSV:{
        
      }

    }

  }
  AzureACC:{
    MANDATORY:{
      Location: 'westeurope'
      LockLevel: 'CanNotDelete'
    }
    GENERAL:{
      APIM: {
        properties: {}
      }
      ID: {
  
      }
      MG: {
  
      }
      POLICY:{
  
      }
      RG:{
  
      }

    }
    NETWORKING:{

      AGW: {
        properties: {}
      }
      ASG: {
  
      }
      BAS:{
  
      }
      CDNP: {
  
      }
      CDNE:{
  
      }
      CON:{
  
      }
      DNSZ:{
  
      }
      PDNSZ:{
  
      }
      AFW:{
  
      }
      AFWP:{
  
      }
      ERC: {
  
      }
      FD:{
  
      }
      FDFP:{
  
      }
      LBI:{
  
      }
      LBE:{
  
      }
      RULE:{
  
      }
      LGW:{
  
      }
      NG:{
  
      }
      NIC:{
  
      }
      NSG:{
  
      }
      NSGSR:{
  
      }
      NW:{
  
      }
      PL:{
  
      }
      PIP:{
  
      }
      IPPRE:{
  
      }
      RF:{
  
      }
      RT:{
  
      }
      SE:{
  
      }
      TRAF:{
  
      }
      UDR:{
  
      }
      VNET:{
  
      }
      PEER:{
  
      }
      SNET:{
  
      }
      VWAN:{
  
      }
      VPNG:{
  
      }
      VCN: {
  
      }
      VST:{
  
      }
      VGW:{
  
      }
      WAF:{
  
      }
      WAGRG:{
  
      }
    }
    COMPUTEWEB:{
      ASE: {
        properties: {}
      }
      PLANWINF1:{
        kind: 'Windows'
        sku: {
          name: 'F1'
          tier: 'Free'
          size: 'F1'
          family: 'F'
          capacity: 0
        }
        properties:{
          perSiteScaling: false
          elasticScaleEnabled: false
          maximumElasticWorkerCount: 1
          isSpot: false
          reserved: false
          isXenon: false
          hyperV: false
          targetWorkerCount: 0
          targetWorkerSizeId: 0
          zoneRedundant: false
        }
      }
      PLANWIN: {
  
      }
      PLANLIN:{
  
      }
      AVAIL:{
  
      }
      ARCS:{
  
      }
      ARCK:{
  
      }
      CLD:{
  
      }
      DES:{
  
      }
      FUNC:{
  
      }
      GAL:{
  
      }
      OSDISK:{
  
      }
      DIKS:{
  
      }
      NTF:{
  
      }
      NTFNS:{
  
      }
      SNAP:{
  
      }
      STAPP:{
  
      }
      VM:{
  
      }
      VMSS:{
  
      }
      STVM:{
  
      }
      APP:{
        mandatory:{
          siteConfig:{
            http20Enabled: true
            minTlsversion: '1.2'
            scmMinTlsVersion: '1.2'
            ftpsState: 'Disabled'
            ipSecurityRestrictions:[
              {
                ipAddress: ' Any'
                action: 'Allow'
                priority: 1
                name: 'Allow all'
                description: ' Allow all access'
              }
            ]
            scmIpSecurityRestrictions: [
              {
                  ipAddress: 'Any'
                  action: 'Allow'
                  priority: 1
                  name: 'Allow all'
                  description: 'Allow all access'
              }
          ]
          }
          httpsOnly: true        
        }
      }

    }
    CONTAINERS:{
      AKS: {
        properties: {}
      }
      CR:{
  
      }
      CI:{
  
      }
      SF:{
  
      }

    }
    DATABASES:{
      COSMOS: {
        properties: {}
      }
      REDIS: {
  
      }
      SQL:{
  
      }
      SQLDB:{
  
      }
      SYN:{
  
      }
      SYNW:{
  
      }
      SYNDP:{
  
      }
      SYNSP:{
  
      }
      MYSQL:{
  
      }
      PSQL:{
  
      }
      SQLSTRDB:{
  
      }
      SQLMI:{
  
      }

    }
    STORAGE:{
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
    AIMACHINE:{
      SRCH: {
        properties: {}
      }
      COG:{
  
      }
      MLW:{
  
      }

    }
    ANALYTICSIOT:{
      AS: {
        properties: {}
      }
      DBW:{
  
      }
      ASA:{
  
      }
      DEC:{
  
      }
      DEDB:{
  
      }
      ADF:{
  
      }
      DLS:{
  
      }
      DLA:{
  
      }
      EVHNS:{
  
      }
      EVH:{
  
      }
      EVGD:{
  
      }
      EVGS:{
  
      }
      EVGT:{
  
      }
      HADOOP:{
  
      }
      HBASE:{
  
      }
      KAFKA:{
  
      }
      SPARK:{
  
      }
      STORM:{
  
      }
      MLS:{
  
      }
      IOT:{
  
      }
      PROVS:{
  
      }
      PCERT:{
  
      }
      PBI:{
  
      }
      TSI:{
  
      }

    }
    AVD:{
      VDPOOL: {
        properties: {}
      }
      VDAG:{
  
      }
      VDWS:{
  
      }

    }
    DEVELOPER:{
      APPCS: {
        properties: {}
      }
      SIGR:{
  
      }

    }
    INTEGRATION:{
      IA: {
        properties: {}
      }
      LOGIC:{
  
      }
      SB:{
  
      }
      SBQ:{
  
      }
      SBT:{
        
      }

    }
    MANGOV:{
      KV: {
        properties: {
          sku:{
            family: 'A'
            name: 'standard'
          }
          tenantId: TenantId
          softDeleteRetentionInDays: 7
          enableSoftDelete: false
          enabledForDeployment: true
          enabledForTemplateDeployment: true
          enabledForDiskEncryption: true
          enableRbacAuthorization: false
          networkAcls: {
            bypass: 'AzureServices'
            defaultAction: 'Allow'
          }
        }
      }
      LOG: {
  
      }
      BPA: {
  
      }
      BP: {
  
      }
      PVIEW:{
  
      }
      AG: {
  
      }
      APPI: {
  
      }
      AA:{
  
      }

    }
    MIGRATION:{
      MIGR: {
        properties: {}
      }
      DMS:{
  
      }
      RSV:{
        
      }

    }
  }
  AzurePRD:{
    MANDATORY:{
      Location: 'westeurope'
      LockLevel: 'CanNotDelete'
    }
    GENERAL:{
      APIM: {
        properties: {}
      }
      ID: {
  
      }
      MG: {
  
      }
      POLICY:{
  
      }
      RG:{
  
      }

    }
    NETWORKING:{

      AGW: {
        properties: {}
      }
      ASG: {
  
      }
      BAS:{
  
      }
      CDNP: {
  
      }
      CDNE:{
  
      }
      CON:{
  
      }
      DNSZ:{
  
      }
      PDNSZ:{
  
      }
      AFW:{
  
      }
      AFWP:{
  
      }
      ERC: {
  
      }
      FD:{
  
      }
      FDFP:{
  
      }
      LBI:{
  
      }
      LBE:{
  
      }
      RULE:{
  
      }
      LGW:{
  
      }
      NG:{
  
      }
      NIC:{
  
      }
      NSG:{
  
      }
      NSGSR:{
  
      }
      NW:{
  
      }
      PL:{
  
      }
      PIP:{
  
      }
      IPPRE:{
  
      }
      RF:{
  
      }
      RT:{
  
      }
      SE:{
  
      }
      TRAF:{
  
      }
      UDR:{
  
      }
      VNET:{
  
      }
      PEER:{
  
      }
      SNET:{
  
      }
      VWAN:{
  
      }
      VPNG:{
  
      }
      VCN: {
  
      }
      VST:{
  
      }
      VGW:{
  
      }
      WAF:{
  
      }
      WAGRG:{
  
      }
    }
    COMPUTEWEB:{
      ASE: {
        properties: {}
      }
      PLANWINF1:{
        kind: 'Windows'
        sku: {
          name: 'F1'
          tier: 'Free'
          size: 'F1'
          family: 'F'
          capacity: 0
        }
        properties:{
          perSiteScaling: false
          elasticScaleEnabled: false
          maximumElasticWorkerCount: 1
          isSpot: false
          reserved: false
          isXenon: false
          hyperV: false
          targetWorkerCount: 0
          targetWorkerSizeId: 0
          zoneRedundant: false
        }
      }
      PLANWIN: {
  
      }
      PLANLIN:{
  
      }
      AVAIL:{
  
      }
      ARCS:{
  
      }
      ARCK:{
  
      }
      CLD:{
  
      }
      DES:{
  
      }
      FUNC:{
  
      }
      GAL:{
  
      }
      OSDISK:{
  
      }
      DIKS:{
  
      }
      NTF:{
  
      }
      NTFNS:{
  
      }
      SNAP:{
  
      }
      STAPP:{
  
      }
      VM:{
  
      }
      VMSS:{
  
      }
      STVM:{
  
      }
      APP:{
        mandatory:{
          siteConfig:{
            http20Enabled: true
            minTlsversion: '1.2'
            scmMinTlsVersion: '1.2'
            ftpsState: 'Disabled'
            ipSecurityRestrictions:[
              {
                ipAddress: ' Any'
                action: 'Allow'
                priority: 1
                name: 'Allow all'
                description: ' Allow all access'
              }
            ]
            scmIpSecurityRestrictions: [
              {
                  ipAddress: 'Any'
                  action: 'Allow'
                  priority: 1
                  name: 'Allow all'
                  description: 'Allow all access'
              }
          ]
          }
          httpsOnly: true        
        }
      }

    }
    CONTAINERS:{
      AKS: {
        properties: {}
      }
      CR:{
  
      }
      CI:{
  
      }
      SF:{
  
      }

    }
    DATABASES:{
      COSMOS: {
        properties: {}
      }
      REDIS: {
  
      }
      SQL:{
  
      }
      SQLDB:{
  
      }
      SYN:{
  
      }
      SYNW:{
  
      }
      SYNDP:{
  
      }
      SYNSP:{
  
      }
      MYSQL:{
  
      }
      PSQL:{
  
      }
      SQLSTRDB:{
  
      }
      SQLMI:{
  
      }

    }
    STORAGE:{
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
            days: 30
          }
          deleteRetentionPolicy: {
            enabled: true
            days: 30
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
    AIMACHINE:{
      SRCH: {
        properties: {}
      }
      COG:{
  
      }
      MLW:{
  
      }

    }
    ANALYTICSIOT:{
      AS: {
        properties: {}
      }
      DBW:{
  
      }
      ASA:{
  
      }
      DEC:{
  
      }
      DEDB:{
  
      }
      ADF:{
  
      }
      DLS:{
  
      }
      DLA:{
  
      }
      EVHNS:{
  
      }
      EVH:{
  
      }
      EVGD:{
  
      }
      EVGS:{
  
      }
      EVGT:{
  
      }
      HADOOP:{
  
      }
      HBASE:{
  
      }
      KAFKA:{
  
      }
      SPARK:{
  
      }
      STORM:{
  
      }
      MLS:{
  
      }
      IOT:{
  
      }
      PROVS:{
  
      }
      PCERT:{
  
      }
      PBI:{
  
      }
      TSI:{
  
      }

    }
    AVD:{
      VDPOOL: {
        properties: {}
      }
      VDAG:{
  
      }
      VDWS:{
  
      }

    }
    DEVELOPER:{
      APPCS: {
        properties: {}
      }
      SIGR:{
  
      }

    }
    INTEGRATION:{
      IA: {
        properties: {}
      }
      LOGIC:{
  
      }
      SB:{
  
      }
      SBQ:{
  
      }
      SBT:{
        
      }

    }
    MANGOV:{
      KV: {
        properties: {
          sku:{
            family: 'A'
            name: 'standard'
          }
          tenantId: TenantId
          softDeleteRetentionInDays: 7
          enableSoftDelete: true
          enabledForDeployment: true
          enabledForTemplateDeployment: true
          enabledForDiskEncryption: true
          enableRbacAuthorization: false
          networkAcls: {
            bypass: 'AzureServices'
            defaultAction: 'Deny'
          }
        }
      }
      LOG: {
  
      }
      BPA: {
  
      }
      BP: {
  
      }
      PVIEW:{
  
      }
      AG: {
  
      }
      APPI: {
  
      }
      AA:{
  
      }

    }
    MIGRATION:{
      MIGR: {
        properties: {}
      }
      DMS:{
  
      }
      RSV:{
        
      }

    }

  }
}

output config object = EnvironmentConfigurationMap
