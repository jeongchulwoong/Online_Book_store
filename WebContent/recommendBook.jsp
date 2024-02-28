<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>��õ ����</title>
	<link rel="stylesheet" href="listStyle2.css">
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	ResultSet rs = DB.getRecommendBookByStarPoint();
	
	int[] bookNoOfRecommendBook = DB.getBookNoOf5Books(rs);
	
	%>
	<div align=center>
	<br>
	<h2>Our Recommend Book</h2>
	<table id="tableId" border=0>
		<tr>
			<% 
			for(int i = 0; i < 3; i++) {
				Book book = DB.getBookByBookNoRS(bookNoOfRecommendBook[i]);
				out.print("<td width=33%;><table id=\"tableInside\" border=0>");
				out.print("<tr><td colspan=3 align=center><img src=\"img/book" + bookNoOfRecommendBook[i] + ".PNG\" width=240 height=360/></td></tr>");
				out.print("<tr><td width=20px></td><th align=center >" + book.getTitle() + "</th><td width=20px></td></tr>");
				out.print("</table></td>");
			}
			%>
		</tr>
		<tr>
			<% 
			for(int j = 3; j < 6; j++) {
				Book book = DB.getBookByBookNoRS(bookNoOfRecommendBook[j]);
				out.print("<td width=33%;><table id=\"tableInside\" border=0>");
				out.print("<tr><td colspan=3 align=center><img src=\"img/book" + bookNoOfRecommendBook[j] + ".PNG\" width=240 height=360/></td></tr>");
				out.print("<tr><td width=20px></td><th align=center>" + book.getTitle() + "</th><td width=20px></td></tr>");
				out.print("</table></td>");
			}
			%>
		</tr>
	</table>
	</div>
</body>
</html>