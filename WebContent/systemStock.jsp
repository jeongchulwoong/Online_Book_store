<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� ���� �ý���</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	String bookNo = request.getParameter("bookNoForStock");
	String numOfBookForStock = request.getParameter("numOfBookForStock");
	int num = Integer.parseInt(numOfBookForStock);
	int no = Integer.parseInt(bookNo);
	
	Book book = (Book) DB.getBookByBookNoRS(no);
	
	if(bookNo.equals("") || numOfBookForStock.equals("")) {
		out.print("<script>alert('����� å�� �Ϸù�ȣ �Ǵ� ������ ��� �Էµ��� �ʾҽ��ϴ�.')</script>");
	}
	else{
		Book bookStock = new Book(no, book.getISBN(), book.getAuthor(), 
				book.getTitle(), book.getSalesAmount(), book.getStock()+num, 
				book.getGenre(), book.getPrice(), book.getDiscount(), 
				book.getPublisher());
		
		DB.stockBook(bookStock);
		
		out.print("<script>alert('��� ����Ǿ����ϴ�.')</script>");
		out.print("<script>window.location.href='javascript:history.back()'</script>");
	}
	
	%>
</body>
</html>