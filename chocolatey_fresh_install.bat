@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install chocolateygui -fy
choco install ctags -fy
choco install curl -fy
choco install git -fy
choco install vim -fy
choco install sourcetree -fy
