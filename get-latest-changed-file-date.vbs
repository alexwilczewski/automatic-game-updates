Dim rootFolder
rootFolder = Wscript.Arguments.Item(0)
Set fso = CreateObject("Scripting.FileSystemObject")
Set folder = fso.GetFolder(rootFolder)
latestChangedTime = GetLatestChangedDateInRecursiveFolder(folder)
Wscript.Echo(latestChangedTime)

Function GetLatestChangedDateInRecursiveFolder(folder)
    Dim latest, latestSub
    latest = folder.DateLastModified
    Set subfolders = folder.SubFolders
    If subfolders.Count > 0 Then
        For Each subfolder in subfolders
            If subfolder.DateLastModified > latest Then
                latest = subfolder.DateLastModified
            End If
            latestSub = GetLatestChangedDateInRecursiveFolder(subfolder)
            If latestSub > latest Then
                latest = latestSub
            End If
        Next
    End If
    Set files = folder.Files
    If files.Count > 0 Then
        For Each file in files
            If file.DateLastModified > latest Then
                latest = file.DateLastModified
            End If
        Next
    End If
    GetLatestChangedDateInRecursiveFolder = latest
End Function