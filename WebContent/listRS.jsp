<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*, java.util.Date" %>
<HTML>
<head>
	<link rel="stylesheet" href="listStyle.css">
</head>
  <BODY>
 	<%	
 	 	   request.setCharacterEncoding("euc-kr");
 	
 	       ResultSet rs = (ResultSet) request.getAttribute("RS");

 	        
 System.out.print("   >> rs : " + rs + "\n");	       
		   ResultSetMetaData md = rs.getMetaData();
		   int count = md.getColumnCount();
		   String[] columns = new String[count];
		   String[] columnTypes = new String[count];
		   for(int i=0; i<count; i++){
			   columns[i] = md.getColumnLabel(i+1);
			   columnTypes[i] = md.getColumnTypeName(i+1);
System.out.print("   >> clms : " + columns[i] + " " + columnTypes[i]+ "\n");	
     	   }
	  %>
	   <br>
	   <H2 align=center > <% out.print(request.getAttribute("title"));   %> </H2>
	   
	   <table align=center valign=top border="0" cellpadding="8" cellspacing="0" bordercolor="#999999"> 
       <%
			out.print("<tr bgcolor=#CCCCCC>" );
			for(int i=0; i<columns.length; i++){
				out.print("<th>" + columns[i]  + "</th>" );	
			}
			out.print("</tr>" );

			while(rs.next()) {
				out.print("<tr>" );

				for(int i=0; i<columns.length; i++){

					Object obj= rs.getObject(columns[i]);
 // System.out.print("   >> col value : " + (obj) + "\n");
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
				out.print("</tr>" );
			}
      %>
	  </table >
  </BODY>
</HTML>
