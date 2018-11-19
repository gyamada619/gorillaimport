# Gorilla Import

A script to help import packages into a gorilla catalog for software distribution on Windows.

The script assumes it is being run inside the [gorilla](https://github.com/1dustindavis/gorilla) repository.
It collects the following:

1. Item Name
2. Display Name
3. Package Path
4. Version

It also generates an SHA 256 hash of the installer file being imported.

## Install & Run

gorillaimport requires [powershell-yaml](https://www.powershellgallery.com/packages/powershell-yaml/0.3.1) to be installed. To install it (PowerShell 5.0 and above) run:

`Install-Module powershell-yaml`

Then execute the script inside the gorilla repo as normal:

`.\gorillaimport.ps1`

