'##############################################
'###
'### listAllGroups.vbs
'### Lists all the groups in the specified domain
'###
'##############################################

Dim strDomain

strDomain = inputbox( "Please enter a Domain Name", "Input" )
If strDomain = "" Then WScript.Quit(1)

Set objComputer = GetObject("WinNT://" & strDomain )
objComputer.Filter = Array( "Group" )
For Each objgroup in objComputer
    wscript.echo "Name: " & objGroup.Name

Next
