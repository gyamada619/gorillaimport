#This module assumes you are running it inside your gorilla repo directory.
#Credit for the gorilla project goes to @1dustindavis. Code for gorilla is at https://github.com/1dustindavis/gorilla/.
function gorillaimport {

    param
    (
        [string]$pkg
    )
  
    #Import YAML handler module
    Import-Module -Name "$PSScriptRoot/powershell-yaml"

    #Get file name & extension from full path to installer
    $importedfile = Split-Path $pkg -Leaf

    #Set default packages directory in gorilla repo
    $pkgpath = "packages/$importedfile"

    #Collect data from user about installer to import
    $catalog = Read-Host -Prompt 'Name of desired catalog (.yaml)'
    $itemname = Read-Host -Prompt 'Item name'
    $displayname = Read-Host -Prompt 'Display Name'
    $type = Read-Host -Prompt 'Type of installer'

    #Get ProductVersion from installer to be imported
    #$version = Get-ItemProperty "$pkg" -Name VersionInfo | Select-Object -ExpandProperty VersionInfo | Select-Object -ExpandProperty ProductVersion

    #Get SHA256 hash of installer
    $filehash = Get-FileHash -Path $pkgpath
    $hashstring = $filehash.Hash

    #Compile user input and hash into YAML data and append it to designated catalog
    $yaml = ConvertTo-Yaml @{"$itemname"=@{"display_name"="$displayname"; "installer"=@{"location"="$pkgpath"; "hash"="$hashstring"; "type"="$type"}}}
    Add-Content -Path "catalogs/$catalog" -Value $yaml -Force

    #Let user know we're done
    Write-Output "Package has been imported sucessfully."

}

Export-ModuleMember -Function gorillaimport

