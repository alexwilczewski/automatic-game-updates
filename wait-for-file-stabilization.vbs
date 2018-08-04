Dim folderToWatch, periodSToWaitForChangesToStop, periodMsToWaitForChangesToStop
Dim latestChangedTime, nowf, cwd
Set fso = CreateObject("Scripting.FileSystemObject")
cwd = fso.GetAbsolutePathName(".")
folderToWatch = """" & Wscript.Arguments.Item(0) & """"
nowf = 0
periodSToWaitForChangesToStop = 60
periodMsToWaitForChangesToStop = (periodSToWaitForChangesToStop * 1000)
Wscript.Echo("Script directory: " & cwd)
Wscript.Echo("Watching folder: " & folderToWatch)
Wscript.Echo("Watching for (s): " & periodSToWaitForChangesToStop)
Do
    If nowf > 0 Then
        wscript.echo("Wait for (ms): " & periodMsToWaitForChangesToStop)
        Wscript.Sleep(periodMsToWaitForChangesToStop)
    End If
    nowf = Now()
    latestChangedTime = GetLatestChangedFilesDate(folderToWatch)
    latestChangedTimeAddedPeriod = DateAdd("s", periodSToWaitForChangesToStop, latestChangedTime)
    Wscript.Echo("Now: " & Now())
    Wscript.echo("Latest Changed Time: " & latestChangedTime)
Loop Until nowf > latestChangedTimeAddedPeriod

Function GetLatestChangedFilesDate(folder)
    Dim wrapperScript, script, args, exec
    wrapperScript = "cscript.exe /nologo"
    script = """" & cwd & "\get-latest-changed-file-date.vbs"""
    args = folder
    Set objShell = Wscript.CreateObject("WScript.Shell")
    exec = wrapperScript & " " & script & " " & args
    Wscript.Echo("Run child watcher: " & exec)
    Set process = objShell.Exec(exec)
    Do While process.Status = 0
        Wscript.Sleep(300)
    Loop
    Execute("GetLatestChangedFilesDate = #" & process.StdOut.ReadLine & "#")
End Function

'1) Starting time is 5:23:00, period is 10s, last file change was 5:20:00 -> Bypass loop
'2) Starting time is 5:23:00, period is 10s, last file change is 5:22:58 -> Loop and wait for 10s
' -) Now starting time is 5:23:10, period is 10s, last file change is 5:22:59 -> Done
'3) Starting time is 5:23:00, period is 10s, last file change is 5:22:58 -> Loop and wait for 10s
' -) Now starting time is 5:23:10, period is 10s, last file change is 5:23:05 -> Loop and wait for 