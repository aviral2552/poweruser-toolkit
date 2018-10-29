'##############################################
'###
'### listAllUsers.vbs
'### Lists all the users in the specified domain
'###
'##############################################

Dim strDomain

    strDomain = inputbox( "Please enter a domainname", "Input" )
if strdomain = "" then wscript.quit(1)
Set objComputer = GetObject("WinNT://" & strDomain )
    objComputer.Filter = Array( "User" )
    For Each objUser In objComputer
        WScript.Echo "Name: " & objUser.Name
        WScript.Echo "Fullname: " & objUser.Fullname
        WScript.Echo "Description: " & objUser.Description
        WScript.Echo "AccountDisabled: " & objUser.AccountDisabled
        WScript.Echo "IsAccountLocked: " & objUser.IsAccountLocked
        WScript.Echo "Profile: " & objUser.Profile
        WScript.Echo "LoginScript: " & objUser.LoginScript
        WScript.Echo "HomeDirectory: " & objUser.HomeDirectory
        WScript.Echo ""
    Next

