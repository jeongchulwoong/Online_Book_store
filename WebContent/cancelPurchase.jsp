<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>���� ���</title>
</head>
<body>
	<%
    Customer customer = (Customer) session.getAttribute("customerLogin"); 
    System.out.println("  << for debug >> in cancelPurchase:customerLogin = " + customer.getCid());
    
    ResultSet rs = DB.getAllCancelRS();
    
    int cnt = DB.getNoTuplesRS(rs);

	if (cnt == 0) {
		out.print("<script>alert('��� ������ �����ϴ�.')</script>");
	} else {
		request.setAttribute("title", "Cancellation List");

		request.setAttribute("RS", rs);
		request.getRequestDispatcher("listRS.jsp").forward(request, response);
	}
    %>
</body>
</html>