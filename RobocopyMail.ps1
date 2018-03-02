$Dest = "\path\to\destination"
Net use $Dest /u:name $Pass

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
$Source = "\path\to\source"  
$Test = Get-content $Log | Select -last 15 
$Pass = Get-Content "C:\robocopylogs\pass.txt" | ConvertTo-SecureString

$File  
if(test-path $log){ 
Set-content -path $log -value $source 
Add-Content -path $log -value $dest 
Add-content -path $log -Value $Test 
if(test-path $log){
$contents = Get-Content -Path $Log
Send-MailMessage -To "name@mail.com" -From "robocopy@mail.com" -SmtpServer "smtpserver" -Subject "Backup Copy" -Body "$contents"
Net use $Dest /Delete
}
} 
}
