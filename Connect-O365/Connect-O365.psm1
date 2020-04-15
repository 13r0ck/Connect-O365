function Connect-O365 {
    $LiveCred = Get-Credential
    if ($LiveCred.Password -eq $null) {Throw "Get-Credential closed by user, or no password entered."}
    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCred -Authentication Basic –AllowRedirection
    Import-PSSession $Session -ea Stop | Import-Module -Global
}

function Disconnect-O365 {
    Remove-PSSession *
}

Set-Alias -Name O365 -Value Connect-O365
Export-ModuleMember -Function Connect-O365 -Alias O365

Set-Alias -Name D365 -Value Disconnect-O365
Export-ModuleMember -Function Disconnect-O365 -Alias D365