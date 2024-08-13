## This downloads the Windows 11 x64 23H2 Cumulative Update for KB5031455 manually.

## 2023-10 Cumulative Update for Windows 11 Version 23H2 for x64-based Systems (KB5031455)
$url = "https://catalog.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e3472ba5-22b6-46d5-8de2-db78395b3209/public/windows11.0-kb5031455-x64_d1c3bafaa9abd8c65f0354e2ea89f35470b10b65.msu"

## Output for 23H2 MSU file
$output = "c:\WindowsUpdate\kb5031455-x64.msu"

## Arguments for this install. Meant to be Silent and No restart.
$arglist = '/quiet /norestart'

## Creates Directory in C drive. Output assumes its in "C:\WindowsUpdate"
New-Item -ItemType Directory -Path C:\WindowsUpdate

## uses wget to download
Invoke-WebRequest -Outfile $output $url

## Script Block to run. Script is setup to run WUSA using defined arguments and let it run through first before ending.
$SB1 = { Start-Process -FilePath 'wusa.exe' -ArgumentList "$output $arglist" -Wait -PassThru }

## Run Script
Invoke-Command -ScriptBlock $SB1

## Remove msu
Remove-Item c:\WindowsUpdate\*.msu