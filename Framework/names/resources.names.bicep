targetScope = 'subscription'
// The name of the team that will be responsible for the resource.
@maxLength(20)
param BusinessUnit string
param EnvironmentType string
// The workload/goal of the resource, for instance the name of an application it supports
param workload string
param createdBy string
param OpsTeam string
param FuncTeam string
param costCenter string
param BusinessAvailibility string
param BusinessConfidentiality string
param BusinessIntegrity string 
param currentDate string = utcNow('yyyy-MM-dd')
// Creation of shorter versions of the workload and the BusinessUnit. This is used for resources with a limited length to the name.
// There is a risk to doing it this way, because results might be non-desirable. An alternative might be to have these values be a parameter
var workloadShort = length(workload) > 5 ? substring(workload,0,5) : workload
var BusinessUnitShort = length(BusinessUnit) > 5 ? substring(BusinessUnit,0,5) : BusinessUnit
// We only need the last 3 letters of the EnvironmentType, so we substract it.
// In this case possible EnvironmentTypes are:
//  AzureDEV
//  AzureTST
//  AzureACC
//  AzurePRD
var EnvironmentTypeLetter = substring(EnvironmentType,5,3)

var tagValues = {
  CreatedBy: createdBy
  deploymentDate: currentDate
  OpsTeam: OpsTeam
  FuncTeam: FuncTeam
  CostCenter: costCenter
  BusinessUnit: BusinessUnit
  Environment: EnvironmentType
  Avilability: BusinessAvailibility
  Confidential: BusinessConfidentiality
  Integrity: BusinessIntegrity 
}


var EnvironmentConfigurationMap = {
  GENERAL: {
    apiManagementServiceName: toLower('apim-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')            // 01.01 This line constructs the resource name for the Api Management Service
    managedIdentityName: toLower('id-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                   // 01.02 This line constructs the resource name for Managed Identities
    managementGroupName: toLower('mg-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                   // 01.03 This line constructs the resource name for Management Groups
    policyDefinitionName: toLower('policy-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')              // 01.04 This line constructs the resource name for Policy Defenitions
    resourceGroupName: toLower('rg-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                     // 01.05 This line constructs the resource name for Resource Groups
  }
  NETWORKING:{
    applicationGatewayName: toLower('agw-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')               // 02.01 This line constructs the resource name for Application Gateway
    aplicationSecurityName:  toLower('asg-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')              // 02.02 This line constructs the resource name for Application Security Group
    azBastionName: toLower('bas-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                     // 02.03 This line constructs the resource name for Azure Bastion
    cdnProfileName: toLower('cdnp-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                      // 02.04 This line constructs the resource name for CDN Profiles
    cdnEndpointName: toLower('cdne-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                     // 02.05 This line constructs the resource name for CDN Endpoints
    connectionsName: toLower('con-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                      // 02.06 This line constructs the resource name for Connections
    dnsName: toLower('dnsz-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                             // 02.07 This line constructs the resource name for DNS
    dnsZoneName: toLower('pdnsz-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                        // 02.08 This line constructs the resource name for DNS Zones (private)
    firewallName: toLower('afw-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                         // 02.09 This line constructs the resource name for Firewalls
    firewallPolicyName: toLower('afwp-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                  // 02.10 This line constructs the resource name for Firewall Policys
    expressRouteCircuitName: toLower('erc-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')              // 02.11 This line constructs the resource name for Express Route Circuits
    frontDoorName: toLower('fd-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                         // 02.12 This line constructs the resource name for Azure Frontdoor
    frontDoorFirewallPolicyName: toLower('fdfp-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')         // 02.13 This line constructs the resource name for Front Door firewall policy
    loadBalancerInternalName: toLower('lbi-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')             // 02.14 This line constructs the resource name for Load Balancer (Internal)
    loadBalancerExternalName: toLower('lbe-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')             // 02.15 This line constructs the resource name for Load Balancer (Internal)
    loadBalancerRuleName: toLower('rule-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                // 02.16 This line constructs the resource name for Load Balancer Rules
    localNetworkGatewayName: toLower('lgw-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')              // 02.17 This line constructs the resource name for Local network gateway
    natGatewayName: toLower('ng_${BusinessUnit}_${workload}_${EnvironmentTypeLetter}')                        // 02.18 This line constructs the resource name for NAT gateway No Hyphens!
    nicName: toLower('nic-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                              // 02.19 This line constructs the resource name for Network Interfaces
    nsgName: toLower('nsg-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                              // 02.20 This line constructs the resource name for Network Security Groups 
    nsgSecurityRuleName: toLower('nsgsr-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                // 02.21 This line constructs the resource name for Network Security Groups Security Rules
    networkWatcherName: toLower('nw-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                    // 02.22 This line constructs the resource name for Network Watchers
    privateEndpointName: toLower('pl-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                   // 02.23 This line constructs the resource name for Private Endpoint (PrivateLink) names
    publicIpaddressName: toLower('pip_${BusinessUnit}_${workload}_${EnvironmentTypeLetter}')                  // 02.24 This line constructs the resource name for Public Ip Addresses
    publicIpadressPrefixName: toLower('ippre_[${BusinessUnit}_${workload}_${EnvironmentTypeLetter}')          // 02.25 This line constructs the resource name for Public Ip Addresses Prefixes
    routeFilterName: toLower('rf-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                       // 02.26 This line constructs the resource name for Route Filters
    routeTableName: toLower('rt-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                        // 02.27 This line constructs the resource name for Route Tables
    serviceEndpointName: toLower('se-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                   // 02.28 This line constructs the resource name for Service Endpoints
    trafficeManagerProfileName: toLower('traf-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')          // 02.29 This line constructs the resource name for Traffic Manager Profiles
    userDefinedRouteName: toLower('udr-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                 // 02.30 This line constructs the resource name for User Defined Routes
    vnetName: toLower('vnet-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                            // 02.31 This line constructs the resource name for Vnets
    snetName: toLower('snet-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                            // 02.32 This line constructs the resource name for Subnets
    vwanName: toLower('vwan-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                            // 02.33 This line constructs the resource name for Virtual Wans
    vpnGatewayName: toLower('vpng-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                      // 02.34 This line constructs the resource name for VPN Gateways
    vpnConnectionName: toLower('vcn-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                    // 02.35 This line constructs the resource name for VPN Connections  
    vpnSiteName: toLower('vcn-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                            // 02.36 This line constructs the resource name for VPN Sites
    virtualNetworkGatewayName: toLower('vgw-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')              // 02.37 This line constructs the resource name for Virtual Network Gateways
    webApplicationFirewallName: toLower('waf-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')             // 02.38 This line constructs the resource name for Web Application Firewalls
    webApplicationFirewallRuleGroupName: toLower('wafrg-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')  // 02.39 This line constructs the resource name for Web Application Firewall policy rule groups
  }
  COMPUTEWEB:{
    appServiceEnvironmentName: toLower('ase-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    appServicePlanName: toLower('plan-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    availabilitySetName: toLower('avail-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    azArcEnabledServerName: toLower('arcs-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    azArcEnabledKuberneticsClusterName: toLower('arck-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    cloudServiceName: toLower('cld-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    diskEncryptionSetName: toLower('des[PLACEHOLDER]${BusinessUnit}${workload}${EnvironmentTypeLetter}')
    functionAppName: toLower('func-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    galleryName: toLower('gal-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    managedOsDiskName: toLower('osdisk-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    managedDiskName: toLower('disk-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    notificationHubName: toLower('ntf-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    notificationHubNamespaceName: toLower('ntfns-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    snapshotname: toLower('snap-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    staticWebAppName: toLower('stapp-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    vmName: toLower('vm-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    vmScaleSetName: toLower('vmss-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    vmStorageAccountName: toLower('stvm[PLACEHOLDER]${workload}${EnvironmentTypeLetter}')
    webAppName: toLower('app-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
  }
  CONTAINERS:{
    aksClusterName: toLower('aks-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    containerRegistryName: toLower('cr[PH]${BusinessUnit}${workload}${EnvironmentTypeLetter}')
    containerinstanceName: toLower('ci-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    serviceFabricName: toLower('sf-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
  }
  DATABASES:{
    azCosmosDatabaseName: toLower('cosmos-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    azCacheRedisInstanceName: toLower('redis-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    azSqlDatabaseServerName: toLower('sql-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}') 
    azSqlDatabaseName: toLower('sqldb-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    azSynapseAnalyticsName: toLower('syn-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    azSynapseAnalyticsWorkspaceName: toLower('synw-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    azSynapseAnalyticsSqlDedicatedPoolName: toLower('syndp-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    azSynapseAnalyticsSparkPoolName: toLower('synsp-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    mysqlDatabaseName: toLower('mysql-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    postgreSqlName: toLower('psql-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    sqlServerStretchedDatabaseName: toLower('sqlstrdb-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    sqlManagedInstanceName: toLower('sqlmi-[PLACEHOLDER]-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
  }
  STORAGE:{
    storageAccountName: toLower('sta${BusinessUnitShort}${workloadShort}${EnvironmentTypeLetter}')
    azSimpleStorageName: toLower('ssimp${BusinessUnitShort}${workloadShort}${EnvironmentTypeLetter}')
  }
  AIMACHINE: {
    azCognitiveSearchName: toLower('srch-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    azCognitiveServicesName: toLower('cog-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    azMachineLearningServicesName: toLower('mlw-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
  }
  ANALYTICSIOT:{
    azAnalysisServicesserverName: toLower('as${BusinessUnitShort}${workloadShort}${EnvironmentTypeLetter}')
    azDatabricksWorkspaceName: toLower('dbw-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    azStreamAnalyticsName: toLower('asa-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    azDataExplorerclusterName: toLower('dec${BusinessUnitShort}${workloadShort}${EnvironmentTypeLetter}')
    azDataExplorerClusterDatabaseName: toLower('dedb${BusinessUnitShort}${workloadShort}${EnvironmentTypeLetter}')
    azDataFactoryName: toLower('adf-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    datalakeStoreAccountName: toLower('dls${BusinessUnitShort}${workloadShort}${EnvironmentTypeLetter}')
    datalakeAnalyticsAccountName: toLower('dla${BusinessUnitShort}${workloadShort}${EnvironmentTypeLetter}')
    eventhubsNamespaceName: toLower('evhns-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    eventhubName: toLower('evh-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    eventgridDomainName: toLower('evgd-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    eventgridSubscriptionsName: toLower('evgs-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    eventgridTopicName: toLower('evgt-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    hadoopClusterName: toLower('haddoop-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    hBaseClusterName: toLower('hbase-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    kafkaClusterName: toLower('kafka-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    sparkClusterName: toLower('spark-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}' )
    stormClusterName: toLower('storm-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    mlServicesClusterName: toLower('mls-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    ioTHubName: toLower('iot-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    provisioningServicesName: toLower('provs-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    provisioningServicesCertificateName: toLower('pcert-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    powerbiEmbeddedName: toLower('pbi-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
    timeseriesInsightEnvironmentName: toLower('tsi-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')
  }
  AVD:{
    avdHostPoolName: toLower('vdpool-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    avdApplicationGroupName: toLower('vdag-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    avdWorkspaceName: toLower('vdws-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
  }
  DEVELOPER:{
    appConfigurationStoreName: toLower('appcs-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    signalRName: toLower('sigr${BusinessUnit}${workload}${EnvironmentTypeLetter}')
  }
  INTEGRATION:{
    integrationAccountName: toLower('ia-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    logicappName: toLower('logic-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    servicebusName: toLower('sb-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    servicebusQueueName: toLower('sbq-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
    servicebusTopicName: toLower('sbt-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')
  }
  MANGOV:{
    automationAccountName: toLower('aa-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')           // 12.01 This line constructs the resource name for Automation accounts
    applicationInsightsName: toLower('appi-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')       // 12.02 This line constructs the resource name for Application Insights
    azMonitorActionGroupName: toLower('ag-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')        // 12.03 This line constructs the resource name for Azure Monitor action groups
    zzPurviewInstanceName: toLower('pview-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')        // 12.04 This line constructs the resource name for Azure Purview instances
    blueprintName: toLower('bp-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')                   // 12.05 This line constructs the resource name for Blueprints
    blueprintAssignmentName: toLower('bpa-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')        // 12.06 This line constructs the resource name for Blueprint assignments
    keyvaultName: toLower('kv-${BusinessUnitShort}-${workloadShort}-${EnvironmentTypeLetter}')          // 12.07 This line creates a short version for KeyVault resources with a max name length of 24
    logAnalyticsWorkspaceName: toLower('log-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')      // 12.08 This line constructs the resource name for Log Analytics workspaces
  }
  MIGRATION:{
    azMigrationProjectName: toLower('migr-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')        // 13.01 This line constructs the resource name for Azure Migrate projects
    databaseMigrationInstanceName: toLower('dms-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')  // 13.02 This line constructs the resource name for Database Migration Service instances
    recoveryServicesVaultName: toLower('rsc-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')      // 13.03 This line constructs the resource name for Recovery Services vaults
  }
}

output names object = EnvironmentConfigurationMap
output tagValues object = tagValues



