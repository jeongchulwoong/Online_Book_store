<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="listStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>마이페이지 고객정보</title>
</head>
<body>
	<%
    Customer customer = (Customer) session.getAttribute("customerLogin"); 
    System.out.println("  << for debug >> in customerMyInfo:customerLogin = " + customer.getCid());
 	%>
 	<div align=center>
 	<br>
 		<h2>My Info</h2>
 		<table align=center valign=top border="0" cellpadding="8" cellspacing="0" bordercolor="#999999">
 			<tr><th id="orange" colspan="3"><%= customer.getCname() %>님의 정보</th></tr>
 			<tr>
 				<td align=right width=45%>이름 :</td>
 				<td width=10%></td>
 				<td><%= customer.getCname() %></td>
 			</tr>
 			<tr>
 				<td align=right>I D :</td>
 				<td></td>
 				<td><%= customer.getCid() %></td>
 			</tr>
 			<tr>
 				<td align=right>PW :</td>
 				<td></td>
 				<td><%= customer.getCpw() %></td>
 			</tr>
 			<tr>
 				<td align=right>연락처 :</td>
 				<td></td>
 				<td><%= customer.getCpn() %></td>
 			</tr>
 			<tr>
 				<td align=right>가입일 :</td>
 				<td></td>
 				<td><%= customer.getDateJoin() %></td>
 			</tr>
 		</table>
 	</div>
</body>
</html>