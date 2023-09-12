targetScope = 'subscription'
param authorizations array
param managedByTenantId string
param mspOfferDescription string
param mspOfferName string
param rgName string


var mspAssignmentName = guid(mspOfferName)
var mspRegistrationName = guid('${mspOfferName}/${mspOfferDescription}')


resource registdef 'Microsoft.ManagedServices/registrationDefinitions@2022-10-01' = {
  name: mspRegistrationName
  properties: {
    registrationDefinitionName: mspOfferName
    description: mspOfferDescription
    managedByTenantId: managedByTenantId
    authorizations: authorizations
  }
}


module registrationAssignments 'registrationAssignments.bicep' = {
  name: 'create-regstration-assignments'
  scope: resourceGroup(rgName)
  params: {
    mspAssignmentName: mspAssignmentName
    registrationDefinitionId: registdef.id
  }
}
