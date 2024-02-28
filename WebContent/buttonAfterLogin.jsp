<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>마이페이지 장바구니 로그아웃</title>
	<link rel="stylesheet" href="aTagStyle.css">
</head>
<body>
    <%
    Customer customer = (Customer) session.getAttribute("customerLogin"); 
    System.out.println("  << for debug >> in buttonAfterLogin:customerLogin = " + customer.getCid());
 	%>
 	
	<table width=100% border=0>
		<tr>
			<td width=430px></td>
			<td align=center>
				<td align=center id="bigChar">JAMES</td>
			</td>
			<td width=220px align=center>
				<a class="custom-btn btn-4" href="mypage.html" target="iframeContent"><font size= 3px>MyPage</font></a>
				<a class="custom-btn btn-4" href="shoppingCart.jsp" target="iframeContent"><font size= 3px>Cart</font></a>
			</td>
			<td width=100px align=center>
				<h2><%=customer.getCname()%></h2>
			</td>
			<td width=110px align=center>
				<form method=POST action="systemLogout.jsp">
						<a class="custom-btn btn-4" href="systemLogout.jsp" target="iframeContent">Logout</a>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>