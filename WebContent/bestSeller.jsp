<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>베스트 셀러</title>
	<link rel="stylesheet" href="listStyle2.css">
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	ResultSet rs = DB.getBestSellerBySalesAmount();
	
	int[] bookNoOfBestseller = DB.getBookNoOf5Books(rs);
	
	%>
	<div align=center>
	<br>
	<h2>Best Seller</h2>
	<table id="tableId" border=0>
		<tr>
			<% 
			for(int i = 0; i < 3; i++) {
				Book book = DB.getBookByBookNoRS(bookNoOfBestseller[i]);
				out.print("<td width=33%;><table id=\"tableInside\" border=0>");
				out.print("<tr><td width=30% colspan=3 align=center><img src=\"img/book" + bookNoOfBestseller[i] + ".PNG\" width=240 height=360/></td></tr>");
				out.print("<tr><td width=20px></td><th align=center >" + book.getTitle() + "</td><td width=20px></td></tr>");
				out.print("</table></td>");
			}
			%>
		</tr>
		<tr>
			<% 
			for(int j = 3; j < 6; j++) {
				Book book = DB.getBookByBookNoRS(bookNoOfBestseller[j]);
				out.print("<td width=33%;><table id=\"tableInside\" border=0>");
				out.print("<tr><td colspan=3 align=center><img src=\"img/book" + bookNoOfBestseller[j] + ".PNG\" width=240 height=360/></td></tr>");
				out.print("<tr><td width=20px></td><th align=center>" + book.getTitle() + "</td><td width=20px></td></tr>");
				out.print("</table></td>");
			}
			%>
		</tr>
	</table>
	</div>
</body>
</html>