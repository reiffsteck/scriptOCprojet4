#creation de la ligne de commande de sauvevarde
Start-Process -FilePath "$CurrentPath\robocopy.exe" -ArgumentList "c:\datapc c:\sav /copy:DAT /E /TS /FP /V /LOG+:c:\data\robo1.log /TEE " -Wait

#attente du script, ceci estun test
Start-Sleep 100
