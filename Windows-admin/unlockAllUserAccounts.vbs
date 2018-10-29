'##############################################
'###
'### unlockAllUserAccounts.vbs
'### Unlocks all user accounts in the specified domain
'###
'##############################################


Dim strDomain
Dim strDomainName
Dim strUser
Dim Counter

Counter=0

'#######################
'### Gathering the domain name from the user
'#######################
strDomainName = inputbox( "Please enter a domainname", "Input" )
if strDomainName = "" then wscript.quit(1)


Set strDomain = GetObject("WinNT://" & strDomainName) 

'#######################
'### Setting up the filter array and running through a If Then loop to set the "IsAccountLocked" attribute to False - Also outputs the users that were unlocked
'#######################
strDomain.Filter = Array("User")

For each User in strDomain
	If User.IsAccountLocked = True Then
		wscript.echo User.Name & "<BR>"
		User.IsAccountLocked = False
		User.SetInfo
		Counter = Counter + 1
	End If
Next

'#######################
'### Outputting the number of locked accounts
'#######################

If Counter = 1 Then
	wscript.echo "Only 1 user account in the " & strDomain.Name & " domain was unlocked."

Else
	wscript.echo Counter & " user accounts were unlocked in the " & strDomain.Name & " domain."

End If