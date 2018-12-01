function gorillaimport {

    #This module assumes you are running it inside your gorilla repo directory.
    #Credit for the gorilla project goes to @1dustindavis. Code for gorilla is at https://github.com/1dustindavis/gorilla/.

    #Import YAML handler module
    Import-Module -Name "$PSScriptRoot/powershell-yaml"

    #Collect data from user about package to import
    $catalog = Read-Host -Prompt 'Name of desired catalog (.yaml)'
    $itemname = Read-Host -Prompt 'Item name'
    $displayname = Read-Host -Prompt 'Display Name'
    $pkgpath = Read-Host -Prompt 'Install Item Location (packages\example.exe)'
    $version = Get-ItemProperty "$pkgpath" -Name VersionInfo | Select-Object -ExpandProperty VersionInfo | Select-Object -ExpandProperty ProductVersion  

    #Get SHA256 hash of installer
    $filehash = Get-FileHash -Path $pkgpath
    $hashstring = $filehash.Hash

    #Compile user input and hash into YAML data and append it to designated catalog
    $yaml = ConvertTo-Yaml @{"$itemname"=@{"display_name"="$displayname"; "installer_item_location"="$pkgpath"; "installer_item_hash"="$hashstring"; "version"="$version"}}
    Add-Content -Path "catalogs/$catalog" -Value $yaml -Force

    #Let user know we're done
    Write-Output "Package has been imported sucessfully."

}

Export-ModuleMember -Function gorillaimport

