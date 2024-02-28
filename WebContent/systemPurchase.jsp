<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>장바구니 구매 처리</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	Customer customer = (Customer) session.getAttribute("customerLogin"); 
	System.out.println("  << for debug >> in systemPurchase:customerLogin = " + customer.getCid());
	
	String[] check = request.getParameterValues("selectBook");
	
	int count=check.length;
	
	int i = 0;
	for(i = 0; i < count; i++) {
		Cart cart = DB.getCartByCartNoRS(check[i]);
		Book book = DB.getBookByBookNoRS(cart.getBookNo());
		
		String ci = cart.getClientId();
		int bn = cart.getBookNo();
		int amount = cart.getSaleAmount();
		int pay = book.getPrice() * amount;
		Purchase purchase = new Purchase(ci, bn, amount, pay);
		Review review = new Review(purchase.getPurchaseNo(), purchase.getBookNo(), 0);
		
		//도서 구매
		DB.insertPurchase(purchase);
		
		//도서 구매후 해당 도서의 정보수정(재고, 판매량)
		DB.updateBookAfterPurchase(bn, amount);
		
		//도서 구매후 장바구니에서 삭제
		DB.deleteCartByCartNo(check[i]);
		
		//도서 구매후 리뷰 생성
		DB.insertReview(review);
	}
	
	out.print("<script>window.location.href='purchaseList.jsp'</script>");
	%>
</body>
</html>