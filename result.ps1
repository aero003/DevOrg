$output = Get-Content .\stdout.json | ConvertFrom-Json
if($output[0].result.details == "ApexClass")
Write-Host "Component Type = $($output[0].result.details.componentSuccesses[0].createdDate)"
#Write-Host "File Name = $($output[0].result.checkOnly)"
#Write-Host "Full Name = $($output[0].result.checkOnly)"
#Write-Host "Status = $($output[0].result.checkOnly)"