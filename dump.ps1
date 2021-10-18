$user = ''
$password = ''
$address = ''
function dumpDatabase {
    param(
        [string]$database,
        [array]$ignoreTables
    )

    $date = Get-Date -UFormat "%Y-%m-%d-%H_%M"
    $db = $database
    $dbFileStructure = "$db-structure-$date.sql"
    $dbFileContent = "$db-content-$date.sql"

    $ignoredTables = ""
    foreach ($ignoreTable in $ignoreTables) {
        $ignoredTables += "--ignore-table=$db.$ignoreTable "
    }

    $databaseOptionsStructure = (
        "--host=$address --password=$password --user=$user " +
        "--verbose --skip-comments --add-drop-table " +
        "--add-drop-database " +
        "--single-transaction --databases --quick --no-data $db"
    )

    $databaseOptionsContent = (
        "--host=$address --password=$password --user=$user " +
        "$ignoredTables " +
        "--no-create-info --verbose --databases --hex-blob " +
        "--skip-triggers --extended-insert --quick $db"
    )

    Start-Process -Wait -NoNewWindow `
        -FilePath mysqldump.exe `
        -ArgumentList "$databaseOptionsStructure" `
        -RedirectStandardOutput $dbFileStructure

    Start-Process -Wait -NoNewWindow `
        -FilePath mysqldump.exe `
        -ArgumentList "$databaseOptionsContent" `
        -RedirectStandardOutput $dbFileContent
}

$ignoredDataTables = @(
    'table1',
    'table2'
)

dumpDatabase "data_base" $ignoredDataTables