targetScope = 'subscription'
param authorizations array
param managedByTenantId string
param mspOfferDescription string
param mspOfferName string
param rgName string


var mspAssignmentName = guid(mspOfferName)
var mspRegistrationName = guid('${mspOfferName}/${mspOfferDescription}')


module regstdef 'registrationDefinitions.bicep' = {
  name: 'create-regstration-definitions'
  params: {
    authorizations: authorizations
    managedByTenantId: managedByTenantId
    mspOfferDescription: mspOfferDescription
    mspRegistrationName: mspRegistrationName
    registrationDefinitionName: mspOfferName
  }
}

module registrationAssignments 'registrationAssignments.bicep' = {
  name: 'create-regstration-assignments'
  scope: resourceGroup(rgName)
  params: {
    mspAssignmentName: mspAssignmentName
    mspRegistrationName: mspRegistrationName
  }
  dependsOn: [
    regstdef
  ]
}

//resource registdef 'Microsoft.ManagedServices/registrationDefinitions@2020-02-01-preview' = {
//  name: mspRegistrationName
//  properties: {
//    registrationDefinitionName: mspOfferName
//    description: mspOfferDescription
//    managedByTenantId: managedByTenantId
//    authorizations: authorizations
//  }
//}
