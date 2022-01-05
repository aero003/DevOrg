#result
$JSONResult = Get-Content .\stdout.json | ConvertFrom-Json |Select-Object -expand  result |Select-Object -expand details | Select-Object -expand componentSuccesses 
$JSONResult | Select-Object @{Name="Component Type";Expression={$_.componentType}}, @{Name="File Name";Expression={$_.fileName}}, @{Name="Full Name";Expression={$_.fullName}}, @{Name="Status";Expression={$_.success}} | Sort-Object success > .\mailResult.txt

$style = "<style>BODY{font-family: Arial; font-size: 13pt;}"
$style = $style + "TABLE{border: 1px solid black; border-collapse: collapse;}"
$style = $style + "TH{border: 1px solid black; background: #dddddd; padding: 5px; }"
$style = $style + "TD{border: 1px solid black; padding: 5px; }"
$style = $style + "</style>"

$to      =  "aeroadithiyan3@gmail.com"
$from    =  "adithiyan@minusculetechnologies.com"
$subject =  "Test Powershell"
$body    =  $JSONResult | Select-Object @{Name="Component Type";Expression={$_.componentType}}, @{Name="File Name";Expression={$_.fileName}}, @{Name="Full Name";Expression={$_.fullName}}, @{Name="Status";Expression={$_.success}} | Sort-Object success | ConvertTo-Html -Head $style 
         

$mail = New-Object System.Net.Mail.Mailmessage $from, $to, $subject, $body
$mail.IsBodyHTML=$true
$server = "smtp.gmail.com"
$port   = 25
$smtp = New-Object System.Net.Mail.SMTPClient $server,$port
$smtp.EnableSsl = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential("adithiyan@minusculetechnologies.com", "tfveajwjepitouum")

$smtp.send($mail)