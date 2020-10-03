@echo off

choco --version
if errorlevel 1 (
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)
setlocal

set /p BasicInstall="Basic dev install? (git, curl, ctags, vim, vundle, python)? (y/n): "
set /p AutoYes="Automatically say yes to all prompts? (y/n): "
set /p ForceOption="Force all choco installations? (y/n): "

if /I "%AutoYes%" == "y" (
	set "AutoYes=y"
) else (
	set AutoYes=
)
if /I "%ForceOption%" == "y" (
	set "ForceOption=f"
) else (
	set ForceOption=
)
set OptionText=-%ForceOption%%AutoYes%
if "%OptionText%" == "-" (
	set OptionText=
)

choco install ctags %OptionText%
choco install curl %OptionText%
choco install git %OptionText%
choco install python --version 3.8 %OptionText%
python -m pip install --upgrade pip
python -m pip install python-language-server
choco install vim %OptionText%
choco install putty %OptionText%

if /I "%BasicInstall%" == "n" (
	choco install chocolateygui %OptionText%
	choco install cmake %OptionText%
	choco install sourcetree %OptionText%
	choco install sql-server-management-studio %OptionText%
	choco install filezilla %OptionText%
	choco install greenshot %OptionText%
)
copy %~dp0MyVimRC %userprofile%\_vimrc
cd %USERPROFILE%
if not exist %userprofile%\vimfiles\bundle\Vundle.vim (
	git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%\vimfiles\bundle\Vundle.vim
)

git config --global user.email "chammel4@gmail.com"
git config --global user.name "Chris Hammel"

gvim +PluginInstall +qall
PAUSE 2>nul
EXIT /B 0
