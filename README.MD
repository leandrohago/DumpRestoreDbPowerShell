# Description
This is a tool created to dump and restore **MySql** and **MariaDb**.

# Links
* Download [release](https://github.com/leandrohago/DumpRestoreDbPowerShell/releases)

# How to use it

* ## Dump
    `Dump.ps1` does two simple things.
    - Dump all the structure database
    - Dump all the content of database

    #### In `dump.ps1` inform
    ```ps1
    $user = ''
    $password = ''
    $address = ''
    ```

    #### To ignore tables just create
    ```ps1
    $ignoredDataTables = @(
        'table1',
        'table2'
    )
    ```

    #### To dump database inform database
    ```ps1
    dumpDatabase "data_base" $ignoredDataTables
    ```

* ## Restore
    `restore.ps1` restores the `.sql` created by `dump.ps1`

    #### In `restore.ps1` inform
    ```ps1
    $user = ''
    $password = ''
    $address = ''
    ```

    #### To restore database just run
    ```ps1
    .\restore.ps1 "data_base.sql"
    ```