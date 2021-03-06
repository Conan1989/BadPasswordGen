<# BadPasswordGen
yes, it's bad.

This is intended for system passwords, where no humans are intended to be able to remember and type out the generated password.
For human passwords, suggest using a password manger, and reading the following
    https://www.xkcd.com/936/
    https://www.ncsc.gov.uk/guidance/password-guidance-simplifying-your-approach

For system passwords, you should probably use something with better random and more secure generation instead, see URL below.
However, excluding special characters seems not to be an option with these. If it's not an issue for your use case, that's good, use that.
If that is an issue, that's bad, here is a bad password generator.


https://docs.microsoft.com/en-us/dotnet/api/system.web.security.membership.generatepassword
https://blogs.technet.microsoft.com/meacoex/2011/08/04/how-to-generate-a-secure-random-password-using-powershell/
#>

Function badPasswordGen {
    param([Parameter(Mandatory=$false)][ValidateRange(12,128)][int]$Length = 32)

    if ($Length -lt 14) {Write-Warning -Message 'password length is low, therefore password is weak'}
    
    $NewPassword        = New-Object System.Collections.ArrayList
    $chrSetAlphanumeric = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.ToCharArray()    
    
    while ($NewPassword.Count -lt $Length) {
        $NewPassword.Add(($chrSetAlphanumeric | Get-Random -Count 1)) | Out-Null
    }

    return ($NewPassword -join $null)
}
