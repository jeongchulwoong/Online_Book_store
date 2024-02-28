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
	
	String[] check = request.getParameterValues("cancelPurchase"); //purchaseNo 반환
	
	int count=check.length;
	String[] reason = new String[count];
	
	
	int i = 0;
	for(i = 0; i < count; i++) {
		reason[i] = request.getParameter("cReason" + Integer.toString(i));
		Purchase purchase = DB.getPurchaseByPurchaseNoRS(check[i]);
		Cancel cancel = new Cancel(check[i], customer.getCid(), reason[i]); 
		
		//구매 취소
		DB.insertCancel(cancel);
		
		//구매 취소후 해당 도서의 정보수정(재고, 판매량)
		DB.updateBookAfterCancel(purchase.getBookNo(), purchase.getPurchaseNum());
		
		//구매 취소후 구매 객체에서 삭제
		DB.deletePurchaseByPurchaseNo(check[i]);
	}
	
	out.print("<script>window.location.href='cancelPurchase.jsp'</script>");
	%>
</body>
</html>