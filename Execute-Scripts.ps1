## Install-Module -Name SqlServer

param(
    [Parameter(Mandatory=$false)]
    [string]
    $Server = "localhost"
)
$connectionString = "server=$Server;uid=sa;pwd=P@ssw0rd;Initial Catalog=master;Connect Timeout=3;"
function Test-SqlConnection{
    $sqlConnection = New-Object System.Data.SqlClient.SqlConnection
    $sqlConnection.ConnectionString =  $connectionString
    $isSuccess = $false
    try
    {
        $sqlConnection.Open()
        if ($sqlConnection.State -eq 'Open')
        {
            $isSuccess = $true
        }
    }
    catch {
        $isSuccess = $false
        Write-Host $error
    }
    finally {
        $sqlConnection.Close();
    }
    return $isSuccess
}

$isLive = $false

while(!$isLive) {

    $isLive = Test-SqlConnection -server $Server
    Start-Sleep -Milliseconds 200
    Write-Progress -Activity "Waiting for database"
}

Write-Progress "Creating Schema"

Invoke-Sqlcmd -ConnectionString $connectionString -InputFile "$PSScriptRoot/schema.sql"

Write-Progress "Completed"
