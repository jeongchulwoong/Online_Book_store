<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>ID 중복확인 처리</title>
</head>
<body>
	<div style="text-align:center">
	<h5>아이디 중복 확인 결과</h5>
	
	<%
	request.setCharacterEncoding("euc-kr");
	String idCheck=request.getParameter("idCheck");
	
	if(DB.checkID(idCheck) > 0) {
		out.println("사용 불가능");
		out.println("</br>");
		out.println("<a href=\"javascript:history.back()\">[다시시도]</a>");
	}
	else {
		out.println("사용 가능");
		out.println("</br>");
		out.println("<a href='javascript:applyID(\"" + idCheck + "\")'>[적용]</a>");
		out.println("<a href=\"javascript:history.back()\">[다시시도]</a>");
		//out.println("<input type=\"button\" value=\"ID 적용\" onclick=\"applyID(idCheck)\"");
	}
	%>
	</div>
	<script>
		function applyID(idCheck) {
			opener.document.joinForm.idForJoin.value=idCheck;
			window.close();
		}
	</script>
</body>
</html>