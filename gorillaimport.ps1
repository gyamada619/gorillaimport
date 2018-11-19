#This script assumes you are running it inside your gorilla repo directory.
#Credit for the gorilla project goes to @1dustindavis. Code for gorilla is at https://github.com/1dustindavis/gorilla/.

#Import YAML handler module
Import-Module powershell-yaml

#Collect data from user about package to import
$catalog = Read-Host -Prompt 'Name of desired catalog (.yaml)'
$itemname = Read-Host -Prompt 'Item name'
$displayname = Read-Host -Prompt 'Display Name'
$pkgpath = Read-Host -Prompt 'Install Item Location (packages\example.exe)'
$version = Read-Host -Prompt 'Package version'

#Get SHA256 hash of installer
$filehash = Get-FileHash -Path $pkgpath
$hashstring = $filehash.Hash

#Compile user input and hash into YAML data and append it to designated catalog
$yaml = ConvertTo-Yaml @{"$itemname"=@{"display_name"="$displayname"; "installer_item_location"="$pkgpath"; "installer_item_hash"="$hashstring"; "version"="$version"}}
Add-Content -Path "catalogs/$catalog" -Value $yaml

#Let user know we're done
Write-Output "Package has been imported sucessfully."

