targetScope = 'subscription'
param mspRegistrationName string
param registrationDefinitionName string
param mspOfferDescription string
param managedByTenantId string
param authorizations array


resource registdef 'Microsoft.ManagedServices/registrationDefinitions@2022-10-01' = {
  name: mspRegistrationName
  properties: {
    registrationDefinitionName: registrationDefinitionName
    description: mspOfferDescription
    managedByTenantId: managedByTenantId
    authorizations: authorizations
  }
}
