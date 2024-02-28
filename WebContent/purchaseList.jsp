<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="listStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>구매내역 리스트</title>
</head>
<body>
	<script>
		function checkbox(form) {
			var values = document.getElementsByName("cancelPurchase");
			var cnt = 0;
			for(var i = 0; i < values.length; i++) {
				if(values[i].checked) {
					cnt++
				}
			}
			if(cnt == 0) {
				alert("체크된 목록이 없습니다.");
				return false;
			}
			return true;
		}
	</script>
	<%
    Customer customer = (Customer) session.getAttribute("customerLogin"); 
    System.out.println("  << for debug >> in purchaseList:customerLogin = " + customer.getCid());
    
    ResultSet rs = DB.getPurcahseListByIdRS(customer.getCid());

	int cnt = DB.getNoTuplesRS(rs);
    
    if(cnt == 0) {
		out.print("<script>alert('구매내역이 없습니다.')</script>");
    }
    else {
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
   	<form name="form" method="POST" action="systemCancel.jsp" onsubmit="return checkbox(this)">
   	<h2 align=center>Purchase History</h2>
   	<table align=center valign=top border="0" cellpadding="8" cellspacing="0" bordercolor="#999999">
   	<%
 	  	out.print("<tr bgcolor=#CCCCCC><th id=\"green\" >선택</th>" );
		for(int i=0; i<columns.length; i++){
			out.print("<th id=\"green\" >" + columns[i]  + "</th>" );	
		}
		out.print("<th id=\"green\" >사유</th></tr>" );
	
		int cnt2 = 0;
		
		while(rs.next()) {
			out.print("<tr><td><label><input type=\"checkbox\" name=\"cancelPurchase\" value=\"" + rs.getObject(columns[0]) + "\"></label></td>" );
			for(int i=0; i<columns.length; i++){

				Object obj= rs.getObject(columns[i]);
				if (obj == null)    // null 객체이면 null을 출력
					out.print("<td align=center> null </td>");
				else if (columnTypes[i].equals("INTEGER") || columnTypes[i].equals("FLOAT")
	    	                         || columnTypes[i].equals("DOUBLE") || columnTypes[i].equals("BIGINT") )
					out.print("<td align=center>" + obj + "</td>");
				else if (columnTypes[i].equals("VARCHAR") && ((String) obj).equals(""))
				     out.print("<td align=center> &nbsp; </td>");
				else if (columnTypes[i].equals("VARCHAR") )
					out.print("<td align=center>"+ obj + "</td>");
			    else
				    out.print("<td align=center>" + obj + "</td>");
			}
			out.print("<td align=center><select name=\"cReason" + cnt2  +"\" size=\"1\">");
			out.print("<option value='단순 변심'>단순 변심</option>");
			out.print("<option value='훼손 및 오배송'>훼손 및 오배송</option>");
			out.print("<option value='기타'>기타</option>");
			out.print("</tr>" );
			cnt2++;
		}
   	%>
   	</table><br>
   	<div align=center>
   	<table align=center valign=top border="0" cellpadding="8" cellspacing="0" bordercolor="#999999">
		<tr><th id="green"><input type="submit" value="취소  / 환불"></th></tr>
		</table>
   	
   	</div>
   	</form>
	<%
    }
 	%>
</body>
</html>