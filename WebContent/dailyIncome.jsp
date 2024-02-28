<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="listStyle.css">
	<title>���� ����</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	java.sql.Date today = new java.sql.Date((new Date()).getTime());
	ResultSet rs = DB.getAllPurchaseOfToday(today);
	
	int cnt = DB.getNoTuplesRS(rs);

	if (cnt == 0) {
		out.print("<script>alert('������ ���ų����� �����ϴ�.')</script>");
	} else {
		rs.beforeFirst();
		out.print("<h2 align=center>���� ���� ����</h2>");
		out.print("<table align=center valign=top border=\"0\" cellpadding=\"8\" cellspacing=\"0\" bordercolor=\"#999999\">" 
	    		 + "<tr bgcolor=#CCCCCC><th >���� �Ϸù�ȣ</th><th >��ID</th><th >������ȣ</th>" 
	    		 + "<th >���ż���</th><th >���Ҿ�</th><th >���� ��¥</th></tr>");
		while( rs.next() ) {
			out.print("<tr><td align=center>" + rs.getString("purchaseNo") + "</td><td align=center>" + rs.getString("clientId") + "</td><td align=center>"
				+ rs.getInt("bookNo") + "</td><td align=center>" + rs.getInt("purchaseNum") + "</td><td align=center>" 
				+ rs.getInt("paymentAmount") + "</td><td align=center>" + rs.getDate("purchaseDate") +"</td></tr>");
		}
		out.print("</table><br>");
		
		int dailyIncome = DB.getDailyIncomeFromRS(rs);
		out.print("<h2 align=center>���� �����</h2>");
		out.print("<table align=center valign=top border=\"0\" cellpadding=\"8\" cellspacing=\"0\" bordercolor=\"#999999\">" 
				+ "<tr bgcolor=#CCCCCC><th >���� ��¥</th><th >�� �ݾ�</th>");
		out.print("<tr><td align=center>" + today + "</td><td align=center>" + dailyIncome + "</td></tr>");
		out.print("</table><br>");
	}
	%>
</body>
</html>