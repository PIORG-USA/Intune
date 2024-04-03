# Creates a OneDrive sync to the US-IT M365 group SharePoint default document library

param (
    [string]$userEmail
)

$siteId = "21986de9-f172-4dc8-8e49-35f61b614b28"
$webId = "17a0f5f8-4075-4003-8210-87916baf1375"
$listId = "6fdfe52d-22b4-44e9-9da2-f51024b5c672"
$webUrl = "https%3a%2f%2fpioneersusa.sharepoint.com%2fsites%2fgroup-it&version=1"
$listTitle = [System.Web.HttpUtility]::UrlEncode("US-IT")
$webTitle = "" # [System.Web.HttpUtility]::UrlEncode("Shared")  Not currently being used.
$odopenUrl = "odopen://sync/?siteId=$SiteId&webId=$WebId&listId=$listId&userEmail=$userEmail&webUrl=$webUrl&listTitle=$listTitle&webTitle=$webTitle"

Write-Output "Connecting to OneDriveSync: $odopenUrl"`n
Start-Process $odopenUrl
Start-Sleep -s 10
Write-Output "Finished"
