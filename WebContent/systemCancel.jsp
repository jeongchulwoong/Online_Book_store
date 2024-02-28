<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	Customer customer = (Customer) session.getAttribute("customerLogin"); 
	System.out.println("  << for debug >> in systemCancel:customerLogin = " + customer.getCid());
	
	String[] check = request.getParameterValues("cancelPurchase"); //purchaseNo ��ȯ
	
	int count=check.length;
	String[] reason = new String[count];
	
	
	int i = 0;
	for(i = 0; i < count; i++) {
		reason[i] = request.getParameter("cReason" + Integer.toString(i));
		Purchase purchase = DB.getPurchaseByPurchaseNoRS(check[i]);
		Cancel cancel = new Cancel(check[i], customer.getCid(), reason[i]); 
		
		//���� ���
		DB.insertCancel(cancel);
		
		//���� ����� �ش� ������ ��������(���, �Ǹŷ�)
		DB.updateBookAfterCancel(purchase.getBookNo(), purchase.getPurchaseNum());
		
		//���� ����� ���� ��ü���� ����
		DB.deletePurchaseByPurchaseNo(check[i]);
	}
	
	out.print("<script>window.location.href='cancelPurchase.jsp'</script>");
	%>
</body>
</html>