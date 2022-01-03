$output = Get-Content .\stdout.json | ConvertFrom-Json
$componentSuccesses = @($output[0].result.details.componentSuccesses)
$length = $componentSuccesses.Count
#Write-Host "Length = $($length)"
#$mailData = @()
#$output[0].result.details.componentSuccesses[0] | Select-Object -Property componentType
$mailData = @()
for($i = 0; $i -lt $length; $i++)
{
    
    $comType = $output[0].result.details.componentSuccesses[$i].componentType
    if(($comType -eq "ApexClass") -or($comType -eq "ConnectedApp"))
    {
        $mailData += "************************************"
        $mailData += "Component Type = $($output[0].result.details.componentSuccesses[$i].componentType)"
        $mailData += "File Name = $($output[0].result.details.componentSuccesses[$i].fileName)"
        $mailData += "Full Name = $($output[0].result.details.componentSuccesses[$i].fullName)"
        $mailData +=  "Status = $($output[0].result.details.componentSuccesses[$i].success)" 
        #Write-Host "Type = $($cmpType)"
        Write-Host "Component Type = $($output[0].result.details.componentSuccesses[$i].componentType)" 
        Write-Host "File Name = $($output[0].result.details.componentSuccesses[$i].fileName)" 
        Write-Host "Full Name = $($output[0].result.details.componentSuccesses[$i].fullName)" 
        Write-Host "Status = $($output[0].result.details.componentSuccesses[$i].success)" 
        Write-Host "************************************"
    }
   
}
$mailData > .\mailResult.txt
Write-Host "len = $($mailData.Count)"

$EmailTo = "aeroadithiyan3@gmail.com "  
    $EmailFrom = "adithiyan@minusculetechnologies.com" 
    $Subject = "Test Powershell"  
    $SMTPServer = "smtp.gmail.com" 
    $SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
    $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
    $SMTPClient.EnableSsl = $true 
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential("adithiyan@minusculetechnologies.com", "tfveajwjepitouum")
    $SMTPClient.Send($SMTPMessage)
