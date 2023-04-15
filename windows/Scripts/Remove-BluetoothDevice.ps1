Param(
[string]$DeviceName
)

if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    Write-Host "This Script requires Administrator privileges."
    Exit
}

if ($DeviceName){
    $DevicesToDelete = Get-PnpDevice | Where-Object {$_.FriendlyName -like $DeviceName}
    if ($DevicesToDelete.Length -ne 0) {
        foreach ($Device in $DevicesToDelete)
        {
            Write-Host "Deleting $($Device.FriendlyName)"
            &"pnputil" /remove-device $Device.instanceId;
        }
    }
    else {
        Write-Host "No such device found.";
    }
}
else {
    Write-Host "No DeviceName provided.";
}

