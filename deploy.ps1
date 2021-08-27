set-variable -name TENANT_ID "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" -option constant
set-variable -name SUBSCRIPTOIN_GUID "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" -option constant

$BICEP_FILE = "main.json"
$parameterFile = "azuredeploy.parameters.dev.json"
$location = "japaneast"

Connect-AzAccount -UseDeviceAuthentication -Tenant ${TENANT_ID} -Subscription ${SUBSCRIPTOIN_GUID}

New-AzDeployment `
  -Name devenvironment `
  -TemplateFile ${BICEP_FILE} `
  -TemplateParameterFile ${parameterFile} `
  -Location $location `
  -Verbose