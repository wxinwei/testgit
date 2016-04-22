<%@ CODEPAGE=936%>
<!--#include virtual="/OA/inc/conn.asp" -->
<%
Response.Charset="gb2312"

Function VbsUnEscape(str)
 Dim x
 x=InStr(str,"%")
 Do While x>0
 VbsUnEscape=VbsUnEscape&Mid(str,1,x-1)
 If LCase(Mid(str,x+1,1))="u" Then
 VbsUnEscape=VbsUnEscape&ChrW(CLng("&H"&Mid(str,x+2,4)))
 str=Mid(str,x+6)
 Else
 VbsUnEscape=VbsUnEscape&Chr(CLng("&H"&Mid(str,x+1,2)))
 str=Mid(str,x+3)
 End If
 x=InStr(str,"%")
 Loop
 VbsUnEscape=VbsUnEscape&str
End Function

if trim(request("act"))="del" then
	id=trim(request("id"))
	conn.execute("delete from pinglun where id="&id&"")
	response.Write "{""msg"":""ok""}"
else
	addtextarea=VbsUnEscape(request("addtextarea"))
	newsid=int(request("newsid"))
	username=VbsUnEscape(request("username"))
	
	set rs=server.createobject("adodb.recordset")
	sql="select * from pinglun"
	rs.open sql,conn,1,3
	rs.addnew
	rs("username")=username
	rs("content")=addtextarea
	rs("addtime")=now()
	rs("newsid")=newsid
	
	rs.update
	rs.close
	set rs=nothing
	
	set rsa=conn.execute("select max(id) as id from pinglun")
	if not rsa.eof then
		id=rsa("id")
	end if
	rsa.close
	set rsa=nothing
	response.Write "{""msg"":""ok"",""username"":"""&username&""",""addtime"":"""&now()&""",""id"":"&id&",""addtextarea"":"""&addtextarea&"""}"
end if
%>