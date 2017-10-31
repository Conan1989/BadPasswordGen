<# yep, it's bad. You should probably being using something like this instead if you can help it (doesn't do zero special characters)

https://blogs.technet.microsoft.com/meacoex/2011/08/04/how-to-generate-a-secure-random-password-using-powershell/
[System.Web.Security.Membership]::GeneratePassword(32,0)
#>


Function funBadPasswordGen
    {
        Param([Parameter(Mandatory=$false)][ValidateRange(1,128)][int]$Length = 32)
        
        Process
            {
                Do {$NewPassword_PlainText += ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray() | Get-Random -Count 1)}
                While ($NewPassword_PlainText.length -lt $Length)

                Return $NewPassword_PlainText
            }
    }
