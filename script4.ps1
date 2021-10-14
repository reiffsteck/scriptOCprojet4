param (
        [string] $nompc

      )

#recuperation du nom pc pour l'adresse de sauvegarde
$nompc=[System.Environment]::MachineName

#creation de la ligne de commande de sauvevarde
Start-Process -FilePath "c:\windows\system32\robocopy.exe" -ArgumentList "c:\datapc c:\sav /copy:DAT /E /TS /FP /V /LOG+:c:\data\robo1.log /TEE " -Wait
#$currentpath pour indiquer le chemin variable $nompc
#attente du script, ceci est un test
Start-Sleep 1
