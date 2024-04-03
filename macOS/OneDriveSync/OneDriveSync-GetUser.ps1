# may need to install brew to install powershell before running this scirpt
# def need to swap out auth codes for some type of encrtyption or certificate
# def want to set this to log output to directory

$tenantId = "5209a0b8-e194-4317-b4fa-e63c83391007"
$appId = "a2ce2e6c-7eaa-4388-8ca8-77b0903dabd2"
$clientSecret = ConvertTo-SecureString -String "LTc8Q~4L2WUlVH3hhC3OmYz~~TX-DSH2uB2Z4c03" -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential($appId, $ClientSecret)

Write-Host "Connecting to Graph."
Connect-MgGraph -TenantId $tenantId -ClientSecretCredential $Credential -NoWelcome

# Get the local device name which is the Entra ID Device DisplayName
$deviceName = Invoke-Expression "scutil --get ComputerName"
Write-Host "Device: $deviceName"

# Retrieve all devices # todo: need to try to narrow this down with a search or filter 
# $devices = Get-MgDevice -All -ExpandProperty registeredOwners
$devices = Get-MgDeviceManagementManagedDevice

# Filter the device list by local display name to find a match
# $matchedDevice = $devices | Where-Object { $_.DisplayName -eq $deviceName }
$device = $devices | Where-Object { $_.DeviceName -eq $deviceName }
Write-Host = "DeviceId: $device.Id"
Write-Host = "AzureDeviceId: $device.AzureAdDeviceId"

if (!$device) {
    Write-Host "Device not found... Exiting."
    Exit 
} 

$userEmail = $device.EmailAddress
Write-Output "User Email: $userEmail"