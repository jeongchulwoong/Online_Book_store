<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="listStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ����</title>
</head>
<body>
	<%
    Manager manager = (Manager) session.getAttribute("managerLogin"); 
    System.out.println("  << for debug >> in managerMyInfo:customerLogin = " + manager.getManagerId());
 	%>
 	 	<div align=center>
 		<p></p>
 		<table table align=center valign=top border="0" cellpadding="8" cellspacing="0" bordercolor="#999999">
 			<tr><th colspan="3">�Ŵ��� <%= manager.getManagerName() %>���� ����</tr>
 			<tr>
 				<td align=right width=48%>������ ��� ��ȣ :</td>
 				<td width=4%></td>
 				<td width=48%><%= manager.getManagerNo() %></td>
 			</tr>
 			<tr>
 				<td align=right>������ ���� :</td>
 				<td></td>
 				<td><%= manager.getManagerName() %></td>
 			</tr>
 			<tr>
 				<td align=right>ID :</td>
 				<td></td>
 				<td><%= manager.getManagerId() %></td>
 			</tr>
 			<tr>
 				<td align=right>PW :</td>
 				<td></td>
 				<td><%= manager.getManagerPw() %></td>
 			</tr>
 			<tr>
 				<td align=right>�ٹ� ���� :</td>
 				<td></td>
 				<td><%= manager.getYears() %></td>
 			</tr>
 		</table>
 	</div>
</body>
</html>