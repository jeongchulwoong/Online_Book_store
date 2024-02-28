<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>장바구니 담기 처리</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	Customer customer = (Customer) session.getAttribute("customerLogin"); 
	
	String amountS = request.getParameter("amountForSale");
	String bnoS = request.getParameter("bookInfoN");
	
	if(amountS.equals("")) {
		out.print("<script>alert('수량을 입력해주세요.')</script>");
		
		out.print("<script>window.location.href='javascript:history.back()'</script>");
	}
	else if(customer == null) {
		out.print("<script>alert('로그인 해주세요.')</script>");
		
		out.print("<script>window.location.href='javascript:history.back()'</script>");
    }
    else {
    	System.out.println("  << for debug >> in systemAddInCart:customerLogin = " + customer.getCid());
    	
		
		int amount = Integer.parseInt(amountS);
		int bno = Integer.parseInt(bnoS);
		
		Book book = DB.getBookByBookNoRS(bno);
		
		System.out.println(customer.getCid());
		System.out.println(book.getBookNo());
		System.out.println((amount+1));
		
		Cart addInCart = new Cart(customer.getCid(), book.getBookNo(), amount);
		
		DB.insertCart(addInCart);
		
		out.print("<script>window.location.href='shoppingCart.jsp'</script>");
    }
    %>
</body>
</html>