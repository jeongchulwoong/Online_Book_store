<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>회원가입 처리</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	String ID = request.getParameter("idForJoin");
	String PW = request.getParameter("pwForJoin");
	String name = request.getParameter("nameForJoin");
	String pn = request.getParameter("pnForJoin");
	
	Customer joinCustomer = new Customer(ID, PW, name, pn);
	
	System.out.println("  << for debug >> in systemJoin.jsp: customer = ");
	joinCustomer.output(); 
	
	DB.insertCustomer(joinCustomer);
	
	out.print("<script>window.location.href='formForLogin.html'</script>");
	%>
</body>
</html>