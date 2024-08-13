# Import the Active Directory module
Import-Module ActiveDirectory

# Import the CSV file
$users = Import-Csv -Path C:\temp\removeusers.csv

# Loop through each user in the CSV file
foreach ($user in $users) {
    # Get the user in Active Directory
    $adUser = Get-ADUser $user.users

    # If the user exists, remove them
    if ($adUser) {
        # Remove the user
        Remove-ADUser -Identity $adUser -Confirm:$false
        Write-Host "Removed user $($user)"
    } else {
        Write-Host "User $($user) not found"
    }
}
