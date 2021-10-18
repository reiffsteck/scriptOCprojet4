param (
        [string] $nompc,
        [string] $ListeRepertoire,
        [string] $nomuser

      )

#recuperation du nom pc pour l'adresse de sauvegarde
$nompc=[System.Environment]::MachineName
#lecture des répertoires sous c:\users 
$ListeRepertoire = Get-ChildItem -Path C:\Users -Exclude Public 

foreach ($repertoires in $ListeRepertoire)
      {
        $nomuser = $repertoires.Name
        if ((test-path "\\SRVACME\sav$\$nompc") -eq $true) 
        { Write-Host "repertoire existe"}
        else 
        {
          Write-host " creation repertoire $nompc du nom de l'ordinateur sauvegardé"
          New-item \\SRVACME\sav$\$nompc -ItemType Directory -Force 
        }
        #Start-Process -FilePath "c:\windows\system32\robocopy.exe" -ArgumentList "c:\datapc \\SRVACME\sav$\$nompc /copy:DAT /E /TS /FP /V /LOG+:c:\robo1.log /TEE " 
        #vrai ligne de commande
        Start-Process -FilePath "c:\windows\system32\robocopy.exe" -ArgumentList "c:\users\$nomuser\Documents \\SRVACME\sav$\$nompc /copy:DAT /E /TS /FP /V /LOG+:c:\robo1.log /TEE " 
        Start-Process -FilePath "c:\windows\system32\robocopy.exe" -ArgumentList "c:\users\$nomuser\Favoris \\SRVACME\sav$\$nompc /copy:DAT /E /TS /FP /V /LOG+:c:\robo1.log /TEE " 

      }

#creation de la ligne de commande de sauvevarde

#chemin des dossiers utilisateurs c:\utilisateurs
#$currentpath pour indiquer le chemin variable $nompc
#attente du script, ceci est un test
#Start-Sleep 1
