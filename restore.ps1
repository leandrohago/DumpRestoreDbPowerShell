$user = ''
$password = ''
$address = ''
function restoreDb {
    param (
        [string]$database
    )

    if (!(Test-Path -Path $database -PathType Leaf)) {
        Write-Warning "You should inform a database"
        Exit 1
    }

    $options = (
        "--user=$user --password=$password --host=$address " +
        "--verbose"
    )

    Start-Process -Wait -NoNewWindow `
        -FilePath mysql.exe `
        -ArgumentList "$options" `
        -RedirectStandardInput "$database"
}

restoreDb $args[0]