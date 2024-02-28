<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>로그아웃 처리</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");   
	   
    Customer customerLogout = (Customer) session.getAttribute("customerLogin");
    
    session.setAttribute("customerLogin", null);
    session.setAttribute("customerLogout", customerLogout);
	
	out.print("<script>window.top.location='index.html'</script>");
	%>
</body>
</html>