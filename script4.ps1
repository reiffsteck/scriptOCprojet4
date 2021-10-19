param (
        [string] $nompc,
        [string] $ListeRepertoire,
        [string] $nomuser

      )

#recuperation du nom pc pour l'adresse de sauvegarde
$nompc=[System.Environment]::MachineName
#lecture des répertoires sous c:\users 
$ListeRepertoire = Get-ChildItem -Path C:\Users -Exclude Public 

#boucle pour chaque répertoire représentant un utilisateur
# test de présence des répertoires utilisateurs et nom ordinateur
# création des répertoires si faux
foreach ($repertoires in $ListeRepertoire)
      {
        $nomuser = $repertoires.Name
        if ((test-path "\\SRVACME\sav$\$nompc") -eq $true) 
          { 
            Write-Host "repertoire existe"
            Write-Output "\\SRVACME\sav$\$nompc"

            if ((test-path "\\SRVACME\sav$\$nompc\$nomuser") -eq $true)
            { 
                Write-Output "repertoire utilisateur existe"
            }
            
            else 
            {
            Write-Output "creation repertoire $nomuser"
            New-Item \\SRVACME\sav$\$nompc\$nomuser -ItemType Directory -Force
            }
          }
        else 
          {
            Write-host " creation repertoire $nompc du nom de l'ordinateur sauvegardé"
            New-item \\SRVACME\sav$\$nompc -ItemType Directory -Force 
            New-Item \\SRVACME\sav$\$nompc\$nomuser -ItemType Directory -Force
          }
        
        #lancement de robocopy et sauvegarde de Documents
        # la deuxième ligne peut servir pour sauvegarder les Favoris, au choix selon les cas
        Start-Process -FilePath "c:\windows\system32\robocopy.exe" -ArgumentList "c:\users\$nomuser\Documents \\SRVACME\sav$\$nompc /copy:DAT /E /TS /FP /V /LOG+:c:\$nompc.log /TEE " 
        #Start-Process -FilePath "c:\windows\system32\robocopy.exe" -ArgumentList "c:\users\$nomuser\Favoris \\SRVACME\sav$\$nompc /copy:DAT /E /TS /FP /V /LOG+:c:\$nompc.log /TEE " 

      }


