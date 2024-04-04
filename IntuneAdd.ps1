PowerShell.exe -ExecutionPolicy Bypass
Install-Script -name Get-WindowsAutopilotInfo -Force
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
get-windowsautopilotinfo.ps1 -online -TenantID 5209a0b8-e194-4317-b4fa-e63c83391007 -appid dfee8a0a-e32a-4e1a-b712-fee5197f7ec7 -appsecret GmD8Q~hNNS7KqwWfHHAMJpK2jyB~6BQwlM5mIa3V
