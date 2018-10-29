'##############################################
'###
'### create100Users.vbs
'### Create 100 users and add to Users group
'###
'##############################################


Set objRootDSE = GetObject("LDAP://rootDSE")
Set objContainer = GetObject("LDAP://cn=Users," & _
objRootDSE.Get("defaultNamingContext"))
For i = 1 To 100
Set objLeaf = objContainer.Create("User", "cn=UserNo" & i)
objLeaf.Put "sAMAccountName", "UserNo" & i
objLeaf.SetInfo
Next
WScript.Echo "100 Users created."

