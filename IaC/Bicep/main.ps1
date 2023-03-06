$MyBicep = "./main.bicep"
$MyBicepParam = "./main.params.json"

$MyAzureResourceGroupName = "ACA"
$MyAzureResourceGroupLocation = "UKSouth"


New-AzResourceGroup -Name $MyAzureResourceGroupName -Location $MyAzureResourceGroupLocation -Tag @{Owner="Dariusz Bzowka"}
Set-AzDefault -ResourceGroupName $MyAzureResourceGroupName
New-AzResourceGroupDeployment -TemplateFile $MyBicep  -TemplateParameterFile $MyBicepParam