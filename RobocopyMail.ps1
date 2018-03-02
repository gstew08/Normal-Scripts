$Dest = "\\192.168.30.59\gareth\Backups"
Net use $Dest /u:gareth $Pass

if(test-path $Dest){
$Log = "C:\robocopylogs\Backup.log" 
$File = if(-not(test-path $Log)){ 
New-Item $Log -ItemType file 
if (test-path $log){ 
robocopy $Source $Dest /mir /R:0 /Log:$Log 
} 
} 
Else{ 
robocopy $Source $Dest /mir /R:0 /Log:$Log} 
$Source = "\\homesvr-dc01\Backup"  
$Test = Get-content $Log | Select -last 15 
$Pass = Get-Content "C:\robocopylogs\pass.txt" | ConvertTo-SecureString

$File  
if(test-path $log){ 
Set-content -path $log -value $source 
Add-Content -path $log -value $dest 
Add-content -path $log -Value $Test 
if(test-path $log){
$contents = Get-Content -Path $Log
Send-MailMessage -To "gareth@garethmail.com" -From "robocopy@garethmail.com" -SmtpServer "192.168.30.6" -Subject "Backup Copy" -Body "$contents"
Net use $Dest /Delete
}
} 
}
