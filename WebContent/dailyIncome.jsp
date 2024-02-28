<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="listStyle.css">
	<title>일일 매출</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	java.sql.Date today = new java.sql.Date((new Date()).getTime());
	ResultSet rs = DB.getAllPurchaseOfToday(today);
	
	int cnt = DB.getNoTuplesRS(rs);

	if (cnt == 0) {
		out.print("<script>alert('오늘의 구매내역이 없습니다.')</script>");
	} else {
		rs.beforeFirst();
		out.print("<h2 align=center>일일 구매 내역</h2>");
		out.print("<table align=center valign=top border=\"0\" cellpadding=\"8\" cellspacing=\"0\" bordercolor=\"#999999\">" 
	    		 + "<tr bgcolor=#CCCCCC><th >구매 일련번호</th><th >고객ID</th><th >도서번호</th>" 
	    		 + "<th >구매수량</th><th >지불액</th><th >구입 날짜</th></tr>");
		while( rs.next() ) {
			out.print("<tr><td align=center>" + rs.getString("purchaseNo") + "</td><td align=center>" + rs.getString("clientId") + "</td><td align=center>"
				+ rs.getInt("bookNo") + "</td><td align=center>" + rs.getInt("purchaseNum") + "</td><td align=center>" 
				+ rs.getInt("paymentAmount") + "</td><td align=center>" + rs.getDate("purchaseDate") +"</td></tr>");
		}
		out.print("</table><br>");
		
		int dailyIncome = DB.getDailyIncomeFromRS(rs);
		out.print("<h2 align=center>일일 매출액</h2>");
		out.print("<table align=center valign=top border=\"0\" cellpadding=\"8\" cellspacing=\"0\" bordercolor=\"#999999\">" 
				+ "<tr bgcolor=#CCCCCC><th >금일 날짜</th><th >총 금액</th>");
		out.print("<tr><td align=center>" + today + "</td><td align=center>" + dailyIncome + "</td></tr>");
		out.print("</table><br>");
	}
	%>
</body>
</html>