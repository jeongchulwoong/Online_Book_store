<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>장바구니 삭제 처리</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	Customer customer = (Customer) session.getAttribute("customerLogin"); 
	System.out.println("  << for debug >> in systemDeleteCart:customerLogin = " + customer.getCid());
	
	String[] check = request.getParameterValues("selectBook");
	int count=check.length;
	for(int i = 0; i < count; i++) {
		DB.deleteCartByCartNo(check[i]);
	}
	out.print("<script>window.location.href='shoppingCart.jsp'</script>");
	%>
</body>
</html>