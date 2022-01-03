$output = Get-Content .\stdout.json | ConvertFrom-Json
$componentSuccesses = @($output[0].result.details.componentSuccesses)
$length = $componentSuccesses.Count
#Write-Host "Length = $($length)"
for($i = 0; $i -lt $length; $i++)
{
    $comType = $output[0].result.details.componentSuccesses[$i].componentType
    if($comType -eq "ApexClass")
    {
        Write-Host "Component Type = $($output[0].result.details.componentSuccesses[$i].componentType)"
        Write-Host "File Name = $($output[0].result.details.componentSuccesses[$i].fileName)"
        Write-Host "Full Name = $($output[0].result.details.componentSuccesses[$i].fullName)"
        Write-Host "Status = $($output[0].result.details.componentSuccesses[$i].success)"
        Write-Host "************************************"
    }
}
