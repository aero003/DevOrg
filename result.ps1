#result PS
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


$prevCommitID = "f36f28e261a5c25d37345c2fdedba04c182797b1" 
$latestCommmitID = "9249b7f60b4884550d0797c15716e476501934b1"
sfdx sgd:source:delta --to $latestCommmitID --from $prevCommitID --output .
$_SourcePath = "package/package.xml"
$_DestinationPath = ".\delta/src"
Copy-item -path $_SourcePath -destination $_DestinationPath 

sfdx sgd:source:delta --from f36f28e261a5c25d37345c2fdedba04c182797b1 --output delta/src --generate-delta

$sourcePath = "delta/src/test.txt"
$destinationPath = "delta/" 

$file = "delta\src"
Remove-Item delta/src -Recurse

Copy-Item -path $sourcePath -destination $destinationPath

#Getting the changed path contents ..

Get-Content .\delta/src/package/package.xml
