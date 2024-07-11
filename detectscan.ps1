$logFile = "C:\Windows\System32\LogFiles\Firewall\pfirewall.log"


$currentDateTime = Get-Date


$ipPortMap = @{}


function Send-TelegramMessage {
    param (
        [string]$message
    )

    $botToken = "ur_token"
    $chatID = "ur_chat_id"
    $url = "https://api.telegram.org/bot$botToken/sendMessage"
    $params = @{
        chat_id = $chatID
        text = $message
    }
    
    Invoke-RestMethod -Uri $url -Method Post -ContentType "application/json" -Body ($params | ConvertTo-Json)
}


Get-Content -Path $logFile | ForEach-Object {
    
    $logEntry = $_ -split ' '

    
    $action = $logEntry[2]
    $srcIP = $logEntry[3]
    $destIP = $logEntry[4]
    $destPort = $logEntry[6]

   
    if (-not $ipPortMap.ContainsKey($srcIP)) {
        $ipPortMap[$srcIP] = @{}
    }

    $ipPortMap[$srcIP][$destPort] = $true

    
    if ($ipPortMap[$srcIP].Keys.Count -gt 200 ) {
        $message = "Possible scan activity detected:\n"
        $message += "Action: $action`n"
        $message += "Source IP: $srcIP`n"
        $message += "Destination IP: $destIP`n"
        $message += "Destination Port: $destPort`n"
        $message += "Time: $($logEntry[0]) $($logEntry[1])`n"
        $message += "Port Count: $($ipPortMap[$srcIP].Keys.Count)`n"

        Send-TelegramMessage -message $message
    }
}
