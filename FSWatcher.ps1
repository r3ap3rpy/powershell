$FTBM = 'C:\Users\Cyber\Desktop\FSWatcher\tobemonitored'
$FLTR = '*.*'

$watcher = New-Object IO.FileSystemWatcher $FTBM, $FLTR -property @{IncludeSubDirectories = $false; NotifyFilter = [IO.NotifyFilters]'FileName, LastWrite'}

Register-ObjectEvent $watcher Created -SourceIdentifier FileCreated -Action {
$name = $Event.SourceEventArgs.Name
$changeType = $Event.SourceEventArgs.ChangeType
$timeStamp = $Event.TimeGenerated
Write-Host "This file: $name, was $changeType at $timeStamp!"
Out-File -filepath 'C:\Users\Cyber\Desktop\FSWatcher\logs\CreationLogs.txt' -append -inputobject "This file: $name, was $changeType at $timeStamp!"
}

Register-ObjectEvent $watcher Deleted -SourceIdentifier FileDeletion -Action {
$name = $Event.SourceEventArgs.Name
$changeType = $Event.SourceEventArgs.ChangeType
$timeStamp = $Event.TimeGenerated
Write-Host "This file: $name, was $changeType at $timeStamp!"
Out-File -filepath 'C:\Users\Cyber\Desktop\FSWatcher\logs\DeletionLogs.txt' -append -inputobject "This file: $name, was $changeType at $timeStamp!"
}

Register-ObjectEvent $watcher Changed -SourceIdentifier FileChange -Action {
$name = $Event.SourceEventArgs.Name
$changeType = $Event.SourceEventArgs.ChangeType
$timeStamp = $Event.TimeGenerated
Write-Host "This file: $name, was $changeType at $timeStamp!"
Out-File -filepath 'C:\Users\Cyber\Desktop\FSWatcher\logs\ChangeLogs.txt' -append -inputobject "This file: $name, was $changeType at $timeStamp!"
}

#Unregister-Event FileDeletion
#Unregister-Event FileChange
#Unregister-Event FileCreated