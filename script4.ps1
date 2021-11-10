param (
        [string] $nompc,
        [string] $ListeRepertoire,
        [string] $nomuser

      )
Clear-host
#recuperation du nom pc pour l'adresse de sauvegarde
$nompc=[System.Environment]::MachineName
#lecture des répertoires sous c:\users sans le répertoire Public
$ListeRepertoire = Get-ChildItem -Path C:\Users -Exclude Public | Select-Object Name

#boucle pour chaque répertoire représentant un utilisateur
# test de présence des répertoires utilisateurs et nom ordinateur
# création des répertoires si faux
foreach ($repertoires in $ListeRepertoire)
      {
        $nomuser = $repertoires.Name
        Write-Host $ListeRepertoire
        Write-Host $repertoires
        Write-Host $nomuser
        Write-Host $nompc

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
        
        robocopy "c:\users\$nomuser\Documents" "\\SRVACME\sav$\$nompc\$nomuser\Documents" /V /FP /TS /LOG+:"\\SRVACME\sav$\$nompc.log" /TEE
        
      }


