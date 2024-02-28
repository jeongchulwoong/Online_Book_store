<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ű� ���� ��� �ý���</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	Manager manager = (Manager) session.getAttribute("managerLogin"); 
	System.out.println("  << for debug >> in systemEnrolBook:managerLogin = " + manager.getManagerId());
	
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String ISBN = request.getParameter("ISBN");
	String genre = request.getParameter("genre");
	String price = request.getParameter("price");
	String publisher = request.getParameter("publisher");
	Long ISBNNo = Long.parseLong(ISBN);
	int priceNo = Integer.parseInt(price);
	
	if(title.equals("") || author.equals("") || ISBN.equals("") || genre.equals("") || price.equals("") || publisher.equals("")) {
		out.print("<script>alert('����� å�� ������ ��� �Էµ��� �ʾҽ��ϴ�.')</script>");
	}
	
	Book enrolBook = new Book(ISBNNo, author, title, 0, 0, genre, priceNo, 0, publisher);
	
	DB.insertBook(enrolBook);
	
	//��� ��ü ����
	Enroll enroll = new Enroll(manager.getManagerId(), enrolBook.getBookNo());
	DB.insertEnroll(enroll);
	
	out.print("<script>alert('���� ����� �Ϸ�Ǿ����ϴ�.')</script>");
	out.print("<script>window.location.href='javascript:history.back()'</script>");
	%>
</body>
</html>