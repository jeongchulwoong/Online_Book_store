<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>ID �ߺ�Ȯ�� ó��</title>
</head>
<body>
	<div style="text-align:center">
	<h5>���̵� �ߺ� Ȯ�� ���</h5>
	
	<%
	request.setCharacterEncoding("euc-kr");
	String idCheck=request.getParameter("idCheck");
	
	if(DB.checkID(idCheck) > 0) {
		out.println("��� �Ұ���");
		out.println("</br>");
		out.println("<a href=\"javascript:history.back()\">[�ٽýõ�]</a>");
	}
	else {
		out.println("��� ����");
		out.println("</br>");
		out.println("<a href='javascript:applyID(\"" + idCheck + "\")'>[����]</a>");
		out.println("<a href=\"javascript:history.back()\">[�ٽýõ�]</a>");
		//out.println("<input type=\"button\" value=\"ID ����\" onclick=\"applyID(idCheck)\"");
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