<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>���������� ������ ���� ó��</title>
</head>
<body>
	<%
    Customer customer = (Customer) session.getAttribute("customerLogin"); 
    System.out.println("  << for debug >> in systemInfoCorrection:customerLogin = " + customer.getCid());
	
	request.setCharacterEncoding("euc-kr");
	
	String pw = request.getParameter("pwForCorrection");
	String name = request.getParameter("nameForCorrection");
	String pn = request.getParameter("pnForCorrection");
	
	Customer custCorrection = new Customer(customer.getCid(), pw, name, pn, customer.getDateJoin());
	
	DB.updateCustomer(custCorrection);
	
	out.print("<script>alert('���������� ������ �����Ͽ����ϴ�. ��α��� ���ֽñ� �ٶ��ϴ�.')</script>");
	out.print("<script>window.top.location='systemLogout.jsp'</script>");
	%>
</body>
</html>