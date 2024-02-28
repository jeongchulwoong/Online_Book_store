<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="aTagStyle.css">
<title>매니저 로그인 후 버튼</title>
</head>
<body>
	<%
	Manager manager = (Manager) session.getAttribute("managerLogin");
	System.out.println("  << for debug >> in buttonAfterLogin:managerLogin = " + manager.getManagerId());
	%>
	
	<table width=100% border=0>
		<tr>
			<td width=300px>
			</td>
			<td align=center id="bigChar">JAMES</td>
			<td width=190px>
				<h2>매니저 &nbsp; <%= manager.getManagerName() %></h2>
			</td>
			<td width=110px align=center>
				<form method=POST action="systemManagerLogout.jsp">
					<input class="custom-btn btn-4" type="submit" value="로그아웃">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>