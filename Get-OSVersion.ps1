Function Get-OSVersion {
    $oSVersion = "$((Get-WmiObject Win32_operatingsystem).Version).$(Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\' -Name UBR)"
    
    Return $oSVersion
}
