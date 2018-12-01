# Gorilla Import

A module to help import packages into a gorilla catalog for software distribution on Windows.

The module currently assumes it is being run inside the [gorilla](https://github.com/1dustindavis/gorilla) repository.
It collects the following:

1. Desired Catalog
2. Item Name
3. Display Name
4. Package Path

It also generates an SHA 256 hash of the installer file being imported, and automatically fetches the product version for the package's installer file.

## Install & Run

gorillaimport requires [powershell-yaml](https://www.powershellgallery.com/packages/powershell-yaml/0.3.1), which is included.

To use the module, run:

```PowerShell
Import-Module -Name \path\to\gorillaimport

