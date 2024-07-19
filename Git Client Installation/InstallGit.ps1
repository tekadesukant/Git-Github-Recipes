#To use this script:

#Open a text editor (e.g., Notepad) and copy the script above.
#Save the file with a .ps1 extension, for example, InstallGit.ps1.
#Open PowerShell as an administrator.
#Navigate to the directory where you saved the script using the cd command.
#Run the script by typing .\InstallGit.ps1 and pressing Enter.

# Check if Winget is installed
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Output "Winget is not installed. Installing Winget..."
    
    # Install App Installer which includes Winget
    Invoke-WebRequest -Uri "https://aka.ms/getwinget" -OutFile "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    Add-AppxPackage -Path "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    
    Write-Output "Winget installation completed."
} else {
    Write-Output "Winget is already installed."
}

# Install Git using Winget
Write-Output "Installing Git..."
winget install --id Git.Git -e --source winget
Write-Output "Git installation completed."

