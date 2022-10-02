'====================================
'variable definition area
'====================================
p_7zip = "vendor\7z.exe" '7-zip program path
p_hhc = "vendor\hhc.exe" 'HTML Help Workshop program path
p_ver = "src\version.cpp" 'version.cpp file path
Set fso = CreateObject("Scripting.FileSystemObject") 'file operating system object
Set osh = CreateObject("WScript.Shell")

If Not fso.FileExists(p_7zip) Then
	WScript.Echo "7z.exe(7-Zip) not found."
	WScript.Quit
End If
If Not fso.FileExists(p_hhc) Then
	WScript.Echo "hhc.exe(HTML Help Workshop) not found."
	WScript.Quit
End If

'If in window mode, change to command line mode and restart
If InStr(1,WScript.FullName,"wscript.exe",1) Then
	cmd = "cscript.exe """ & WScript.ScriptFullName & """"
	cmd = cmd & " """ & downDir & """"
	osh.Run cmd
	WScript.Quit
End If
'====================================
'function area
'====================================
'read text by encoding
Function LoadText(FilePath,charset)
	Set adostream = CreateObject("ADODB.Stream")
	With adostream
		.Type = 2
		.Open
		.Charset = charset
		.Position = 0
		.LoadFromFile FilePath
		LoadText = .readtext
		.close
	End With
	Set adostream = Nothing
End Function
'regular expression search
Function RegExpSearch(strng, patrn) 
	Dim regEx      ' Create variable.
	Set regEx = New RegExp         ' Create regular expression.
	regEx.Pattern = patrn         ' Set the pattern.
	regEx.IgnoreCase = True         ' Set whether to be case sensitive, True is insensitive.
	regEx.Global = True         ' Set global match.
	regEx.MultiLine = True
	Set RegExpSearch  = regEx.Execute(strng)
'	If RegExpSearch.Count > 0 Then
'		MsgBox RegExpSearch.Item(0)
'		If RegExpSearch.Item(0).Submatches.Count > 0 Then
'			Set SubMatches = RegExpSearch.Item(0).Submatches
'			MsgBox SubMatches.Item(0)
'		End If
'	End If
	Set regEx = Nothing
End Function
'====================================
'main code
'====================================
verCpp = LoadText(p_ver,"utf-8")
verStrStart = InStr(verCpp,vbCrLf) + Len(vbCrLf)
verStrLength = InStr(verStrStart,verCpp,vbCrLf) - verStrStart
verStr = Mid(verCpp,verStrStart,verStrLength)
Set verStrReg = RegExpSearch(verStr,"\d+\.\d+\.\d+\.\d+")
verNum = verStrReg.Item(0)

WScript.Echo "Compiling help project(FastCopy.chm) ..."
command = """" & p_hhc & """ help\fastcopy.hhp"
Set oExec = osh.Exec(command)
Do While oExec.StdOut.AtEndOfStream <> True
	'output content
	ReadLine = oExec.StdOut.ReadLine
	WScript.Echo ReadLine
Loop
If fso.FileExists("help\FastCopy.chm") Then
	fso.MoveFile "help\FastCopy.chm","doc\FastCopy.chm"
End If

curDir = osh.CurrentDirectory + "\"
Dim platform,bit
platform = Split("x86,x64", ",")
bit = Split("win-32bit,win-64bit", ",")
For xi = 0 To 1
	zipName = "FastCopy-M_" & verNum & "_" & bit(xi) & ".zip"
	WScript.Echo "Add files to " & zipName & ""
	'7-Zip command line to unzip the file
	command = """" & p_7zip & """ a -tzip"
	command = command & " """ & zipName & """ " 'Compressed package address
	command = command & " doc "
	command = command & " """ & curDir & "Output\Release\" & platform(0) & "\FastExt1.dll"" "
	command = command & " """ & curDir & "Output\Release\" & platform(1) & "\FastEx64.dll"" "
	command = command & " """ & curDir & "Output\Release\" & platform(xi) & "\FastCopy.exe"" "
	command = command & " """ & curDir & "Output\Release\" & platform(xi) & "\setup.exe"" "
	Set oExec = osh.Exec(command)
	Do While oExec.StdOut.AtEndOfStream <> True
		ReadLine = oExec.StdOut.ReadLine
		WScript.Echo ReadLine
	Loop
Next

Msgbox "Done."
Set fso=Nothing
Set osh=Nothing
