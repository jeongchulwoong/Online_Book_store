<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>���������� ������ ������ ���� PWȮ�� ó��</title>
</head>
<body>
	<%
    Customer customer = (Customer) session.getAttribute("customerLogin"); 
    System.out.println("  << for debug >> in systemCheckPw:customerLogin = " + customer.getCid());
    
    String pw = request.getParameter("pwForCorrection");
    
    if( pw.equals(customer.getCpw()) ) {
    	out.print("<script>window.location.href='customerInfoCorrection.jsp'</script>");
    }
    else {
    	out.print("<script>alert('PW�� ��ġ���� �ʽ��ϴ�.')</script>");
    	out.print("<script>window.location.href='checkPwForCustInfoCorrection.html'</script>");
    }
    
 	%>
</body>
</html>