<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="listStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>장바구니</title>
</head>
<body>
	<script>
		function checkbox(form) {
			var values = document.getElementsByName("selectBook");
			var cnt = 0;
			for(var i = 0; i < values.length; i++) {
				if(values[i].checked) {
					cnt++
				}
			}
			if(cnt == 0) {
				alert("체크가 하나도 안되어 있습니다.");
				return false;
			}
			return true;
		}
	</script>
	<%
	request.setCharacterEncoding("euc-kr");
	
	Customer customer = (Customer) session.getAttribute("customerLogin"); 
	System.out.println("  << for debug >> in shoppingCart:customerLogin = " + customer.getCid());
	
	ResultSet rs = DB.getAllCartsRS();
	
	int cnt = DB.getNoTuplesRS(rs);
		
	if (cnt == 0) {
   		out.print("<script>alert('담긴 도서가 하나도 없습니다.')</script>");
   		out.print("<script>window.location.href='javascript:history.back()'</script>");
   	} else {
   		/** 
   		request.setAttribute("title", "모든 장바구니 리스트");

   		request.setAttribute("RS", rs);
   		request.getRequestDispatcher("listRS.jsp").forward(request, response);
   		**/
   		ResultSetMetaData md = rs.getMetaData();
		int count = md.getColumnCount();
		String[] columns = new String[count];
		String[] columnTypes = new String[count];
		for(int i=0; i<count; i++){
			columns[i] = md.getColumnLabel(i+1);
			columnTypes[i] = md.getColumnTypeName(i+1);
  	   }
   	%>
   	<br>
   	<form name="form" method="POST" onsubmit="return checkbox(this)">
   	<h2 align=center>Shopping Cart</h2>
   	<table align=center valign=top border="0" cellpadding="8" cellspacing="0" bordercolor="#999999">
   	<%
   		out.print("<tr bgcolor=#CCCCCC><th>선택</th>" );
		for(int i=0; i<columns.length; i++){
			out.print("<th>" + columns[i]  + "</th>" );	
		}
		out.print("</tr>" );
		
		while(rs.next()) {
			out.print("<tr><td><label><input type=\"checkbox\" name=\"selectBook\" value=\"" + rs.getObject(columns[0]) + "\"></label></td>" );
			for(int i=0; i<columns.length; i++){

				Object obj= rs.getObject(columns[i]);
				if (obj == null)    // null 객체이면 null을 출력
					out.print("<td> null </td>");
				else if (columnTypes[i].equals("INTEGER") || columnTypes[i].equals("FLOAT")
		                             || columnTypes[i].equals("DOUBLE") || columnTypes[i].equals("BIGINT") )
					out.print("<td align=right>" + obj + "</td>");
				else if (columnTypes[i].equals("VARCHAR") && ((String) obj).equals(""))
				     out.print("<td> &nbsp; </td>");
				else if (columnTypes[i].equals("VARCHAR") )
					out.print("<td align=left>"+ obj + "</td>");
			    else
				    out.print("<td>" + obj + "</td>");
			}
			out.print("</tr>" );
		}
   	%>
   	</table><br>
   	<div align=center>
   	<table align=center valign=top border="0" cellpadding="8" cellspacing="0" bordercolor="#999999">
		<tr>
			<th>
				<input align=right type="submit" onclick="javascript: form.action='systemDeleteCart.jsp';" value="삭제">
				<input align=left type="submit" onclick="javascript: form.action='systemPurchase.jsp';" value="구매">
			</th>
		</tr>
	</table>
   	</div>
   	</form>
   	<%
   	}
	%>
</body>
</html>