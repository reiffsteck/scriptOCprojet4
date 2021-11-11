Clear-Host

$nompc = $env:COMPUTERNAME

$ListeRepertoire = Get-ChildItem -Path C:\Users | Select-Object Name

foreach ($repertoires in $ListeRepertoire)
{
    $nomuser = $repertoires.Name
    New-item \\SRVACME\sav$\$nompc -ItemType Directory -Force 
    Write-host "creation repertoire nompc" $nompc
    New-Item \\SRVACME\sav$\$nompc\$nomuser -ItemType Directory -Force
    Write-host "creation repertoire nomuser" $nomuser
    robocopy "c:\users\$nomuser\Documents" "\\SRVACME\sav$\$nompc\$nomuser\Documents" /V /FP /TS /LOG+:"\\SRVACME\sav$\$nompc.log" /TEE
}
