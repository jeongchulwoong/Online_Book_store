<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="listStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>도서검색 처리</title>
	<style>
	#button {
	height: 36px;
	}
	#bar {
	height: 30px;
	}
	</style>
</head>
<body>
	<div>
	<%
	request.setCharacterEncoding("euc-kr");
	
	String box = request.getParameter("boxForSearch");
	
	if(box.equals("")) {
		out.print("<script>alert('검색 키워드를 작성해주세요.')</script>");
		
		out.print("<script>window.location.href='javascript:history.back()'</script>");
	}
	%>
	<%
		//out.print("<script>window.location.href='searchByTitle.jsp'</script>");
		ResultSet rs = DB.getBooksByTitleRS(box);
    	int cnt = DB.getNoTuplesRS(rs);

    	if (cnt == 0) {
    		out.print("<script>alert('해당 도서가 하나도 없습니다.')</script>");
    		
    		out.print("<script>window.location.href='javascript:history.back()'</script>");
    	} else {
    		rs.beforeFirst();
    		out.print("<h2 align=center>'" + box + "' 관련 도서</h3>");
    		out.print("<table align=center valign=top border=\"0\" cellpadding=\"8\" cellspacing=\"0\" bordercolor=\"#999999\">"
    		 + "<tr bgcolor=#CCCCCC><th id=\"d\">도서번호</th><th id=\"d\">제목</th><th id=\"d\">저자</th><th id=\"d\">장르</th><th id=\"d\">가격</th><th id=\"d\">출판사</th></tr>");
    		while( rs.next() ) {
    			out.print("<tr><td align=center>" + rs.getInt("bookNo") + "</td><td align=center>" + rs.getString("title") + "</td><td align=center>"
    				+ rs.getString("author") + "</td><td align=center>" + rs.getString("genre") + "</td><td align=center>" 
    				+ rs.getInt("price") + "</td><td align=center>" + rs.getString("publisher") +"</td></tr>");
    		}
    		out.print("</table><br>");
    		
    		//기존 rs 출력(안씀)
    		/**
    		request.setAttribute("title", "'" + box + "' 관련 도서 ");

    		request.setAttribute("RS", rs);
    		request.getRequestDispatcher("listRS.jsp").forward(request, response);
    		**/
    	}
	%>
	</div>
	 
	<div>
		<form action="bookInfo.jsp" method="POST">
		<table align=center border=0>
			<tr height=40px><th id="d">
			<%
			out.print("<input id=\"bar\" type=\"text\" name=\"bookNoForInfo\" placeholder=\"도서 번호\" size=20> &nbsp");
			out.print("<input id=\"button\" type=\"submit\" value=\"Search\">");
			%>
			</th>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>