'##############################################
'###
'### ASCII2base64.vbs
'### Adds the specified user to the Users group
'###
'###Usage: cscript ASCII2base64.vbs <String>
'##############################################

Option Explicit
Const ForReading = 1

Dim aVals(63)

Main

Sub Main()
    Dim stIn
    Dim stOut
    Dim oArgs

	Set oArgs = WScript.Arguments
	
    InitVals
	Out ""
    stOut = Base64(""" n e w P a s s w o r d "" ")
    Out stOut
End Sub

Sub InitVals()
    Dim i
    
    For i = 0 To 25
        aVals(i) = Chr(i + Asc("A"))
        aVals(i + 26) = Chr(i + Asc("a"))
    Next
    For i = 0 To 9
        aVals(i + 52) = Chr(i + Asc("0"))
    Next
    aVals(62) = "+"
    aVals(63) = "/"
End Sub

Function Base64(stText)
    Dim stTrio
    Dim stTemp
    Dim stQuad
    Dim stOut
    
    stTemp = stText
    Do While Len(stTemp) > 2
        stTrio = Left(stTemp, 3)
        stTemp = Right(stTemp, Len(stTemp) - 3)
        stQuad = MakeQuad(stTrio)
        stOut = stOut & stQuad
    Loop
    If Len(stTemp) = 2 Then
        stTrio = stTemp & Chr(0)
        stQuad = MakeQuad(stTrio)
        stQuad = Left(stQuad, 3) & "="
        stOut = stOut & stQuad
    ElseIf Len(stTemp) = 1 Then
        stTrio = stTemp & Chr(0) & Chr(0)
        stQuad = MakeQuad(stTrio)
        stQuad = Left(stQuad, 2) & "=="
        stOut = stOut & stQuad
    End If  
    
    Base64 = stOut
End Function

Function MakeQuad(stTrio)
    Dim lngVal
    Dim stChar
    Dim i
    Dim stOut
    
    stOut = ""
    lngVal = 0
    For i = 1 To 3
        stChar = Mid(stTrio, i, 1)
        lngVal = lngVal * 256
        lngVal = lngVal + Asc(stChar)
    Next
    
    For i = 1 To 4
        stOut = aVals(lngVal And 63) & stOut
        lngVal = lngVal \ 64
    Next
    MakeQuad = stOut
End Function

Sub Out(stLine)
	WScript.Echo stLine
End Sub