﻿# This runs before upgrade or uninstall.
# Use this file to do things like stop services prior to upgrade or uninstall.
# NOTE: It is an anti-pattern to call chocolateyUninstall.ps1 from here. If you
#  need to uninstall an MSI prior to upgrade, put the functionality in this
#  file without calling the uninstall script. Make it idempotent in the
#  uninstall script so that it doesn't fail when it is already uninstalled.
# NOTE: For upgrades - like the uninstall script, this script always runs from
#  the currently installed version, not from the new upgraded package version.
$ErrorActionPreference = 'Stop';

if (Test-Path -Path "HKLM:\SOFTWARE\Razer\Synapse3") {
  & "C:\ProgramData\Razer\Synapse3\Uninstall\RazerStringTranslations\RazerStringTranslationsUninstall.exe" "/S"
  & "C:\ProgramData\Razer\Synapse3\Uninstall\RazerSynapseConfigurationData\RazerSynapseConfigurationDataUninstall.exe" "/S"
  & "C:\ProgramData\Razer\Synapse3\Uninstall\RazerSynapse\RazerSynapseUninstall.exe" "/S"
}