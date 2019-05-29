@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install chocolateygui -fy
choco install ctags -fy
choco install curl -fy
choco install git -fy
choco install python -fy
python -m pip install --upgrade pip
python -m pip install python-language-server
choco install anaconda3 -fy
choco install vim -fy
choco install cmake -fy
choco install sourcetree -fy
choco install sql-server-management-studio -fy
choco install putty -fy

cd %USERPROFILE%
git clone https://github.com/VundleVim/Vundle.vim.git:q %USERPROFILE%/vimfiles/bundle/Vundle.vim
