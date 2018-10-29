'##############################################
'###
'### addUser.vbs
'### Creates a new user and adds to the Users group
'###
'##############################################

Dim strDomain
Dim strDomainName
Dim strUser
Dim strNewUser

strDomainName = inputbox( "Please enter a domainname", "Input" )
if strDomainName = "" then wscript.quit(1)

strNewUser = inputbox( "Please enter a user", "Input" )
if strNewUser = "" then wscript.quit(1)

Set strDomain = GetObject("WinNT://" & strDomainName )

Set strUser = strDomain.Create("User", strNewUser)

strUser.setinfo

wscript.echo "User " & strNewUser & " successfully added"