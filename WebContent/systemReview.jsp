<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>리뷰 처리</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	Customer customer = (Customer) session.getAttribute("customerLogin"); 
	System.out.println("  << for debug >> in systemReview:customerLogin = " + customer.getCid());
	
	ResultSet rs = DB.getRSForReviewList(customer.getCid());
	
	int cnt = DB.getNoTuplesRS(rs);
	
	String[] reviewNo = DB.getReviewNoFromRS(rs);
	//out.print(reviewNo.length);
	String[] point = new String[cnt];
	//point[0] = request.getParameter("point" + Integer.toString(0));
	//out.print(point[0]);

	for(int i = 0; i < cnt; i++) {
		point[i] = request.getParameter("point" + Integer.toString(i));
		DB.updateStarPointAfterSetReview(reviewNo[i], Integer.parseInt(point[i]));
	}
	
	out.print("<script>window.location.href='setReview.jsp'</script>");
	
	%>
</body>
</html>