'##############################################
'###
'### setPassword.vbs
'### Sets the password of the specified user
'###
'##############################################

Set objArgs = WScript.Arguments
If objArgs.Count = 0 Then
    strPassword = InputBox("Enter Password")
Else
    strPassword = objArgs(0)
End If
Set WSHNetwork = CreateObject("WScript.Network")
Set UserObj = GetObject("WinNT://" & WSHNetwork.UserDomain & "/" & WSHNetwork.UserName)
UserObj.SetPassword(strPassword)