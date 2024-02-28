<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="listStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>리뷰 작성</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	Customer customer = (Customer) session.getAttribute("customerLogin"); 
	System.out.println("  << for debug >> in setReview:customerLogin = " + customer.getCid());
	
	ResultSet rs = DB.getRSForReviewList(customer.getCid());
	
	int cnt = DB.getNoTuplesRS(rs);

	if (cnt == 0) {
		out.print("<script>alert('리뷰할 도서가 하나도 없습니다.')</script>");
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
	   	<form name="form" method="POST" action="systemReview.jsp">
	   	<h2 align=center>Create Review</h2>
	   	<table align=center valign=top border="0" cellpadding="8" cellspacing="0" bordercolor="#999999">
	   	<%
   		out.print("<tr bgcolor=#CCCCCC>" );
		for(int i=0; i<columns.length; i++){
			out.print("<th id=\"purple\">" + columns[i]  + "</th>" );	
		}
		out.print("</tr>" );
		
		int cnt2 = 0;
		
		while(rs.next()) {
			
			out.print("<tr>" );
			for(int i=0; i<columns.length; i++){
				Object obj= rs.getObject(columns[i]);
				if(i < columns.length-1) {
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
				else {
					out.print("<td align=center><select name=\"point" + cnt2  +"\" size=\"1\">");
					if(rs.getInt(columns[i]) == 0) {
						out.print("<option value='"+0+"' selected>"+0+"</option>");
					}
					for(int j = 1; j < 6; j++) {
						if(rs.getInt(columns[i]) == j) {
							out.print("<option value='"+j+"' selected>"+j+"</option>");
						}
						else {
							out.print("<option value='"+j+"'>"+j+"</option>");
						}
					}
					
					out.print("</select></td>");
				}
			}
			out.print("</tr>" );
			cnt2++;
		}
		%>
		</table><br>
		<div align=center>
		<table align=center valign=top border="0" cellpadding="8" cellspacing="0" bordercolor="#999999">
		<tr><th id="purple"><input type="submit" value="별점 변경"></th></tr>
		</table>
		</div>
   		</form>
		<%
	}
	%>
</body>
</html>