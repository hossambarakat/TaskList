param(
    [Parameter(Mandatory=$true)]
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
    }
    finally {
        $sqlConnection.Close();
    }
    return $isSuccess
}

$isLive = $false

while(!$isLive) {

    $isLive = Test-SqlConnection -server "localhost"
    Start-Sleep -Milliseconds 200
    Write-Progress -Activity "Waiting for database"
}

Write-Progress "Creating Schema"

Invoke-Sqlcmd -ConnectionString $connectionString -InputFile "$PSScriptRoot\schema.sql"

Write-Progress "Completed"
