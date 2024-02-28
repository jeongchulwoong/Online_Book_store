<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="listStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>도서 상세 정보</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	String bNo = request.getParameter("bookNoForInfo");
	
	if(bNo.equals("")) {
		out.print("<script>alert('도서번호를 입력해주세요.')</script>");
		
		out.print("<script>window.location.href='javascript:history.back()'</script>");
	}
	else {
		int bNoI = Integer.parseInt(bNo);
	
		Book book = DB.getBookByBookNoRS(bNoI);
		
		String bnoS = Integer.toString(book.getBookNo());
		
	%>
	<form action="systemAddInCart.jsp" method="POST">
	<h3 align=center><input type="text" name="bookInfoN" value="<%= book.getBookNo() %>" size=3 style="text-align:center;" readonly>도서 정보</h3>
	<table align=center width=80% border=0>
	<tr>
		<th id="d" width=30%>
			<table border=0>
				<tr><th><img src="img/book<%= bnoS %>.PNG" width=100%/></th></tr>
			</table>
		</th>
		<th id="d">
			<table align=center border=0>
				<tr><td>도서 번호</td><th id="d">:</th><td><%= book.getBookNo() %></td></tr>
				<tr><td>도서 제목</td><th id="d">:</th><td><%= book.getTitle() %></td></tr>
				<tr><td>저 자</td><th id="d">:</th><td><%= book.getAuthor() %></td></tr>
				<tr><td>장 르</td><th id="d">:</th><td><%= book.getGenre() %></td></tr>
				<tr><td>가 격</td><th id="d">:</th><td><%= book.getPrice() %></td></tr>
				<tr><td>출판사</td><th id="d">:</th><td><%= book.getPublisher() %></td></tr>
				<tr><td>ISBN</td><th id="d">:</th><td><%= book.getISBN() %></td></tr>
				<tr><td>할인율</td><th id="d">:</th><td><%= book.getDiscount() %>%</td></tr>
			</table>
		</th>
	</tr>
	</table>
	
	<table align=center valign=top border="0" cellpadding="8" cellspacing="0" bordercolor="#999999">
		<tr>
			<th id="d">수량:</th>
			<th id="d"><input type="text" name="amountForSale" size=10></th>
			<th id="d"><input type="submit" value="장바구니 담기"></th>
		</tr>
	</table>
	</form>
	<%
	}
	%>
</body>
</html>