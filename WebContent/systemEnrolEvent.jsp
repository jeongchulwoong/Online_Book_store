<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ű� �̺�Ʈ ��� �ý���</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	Manager manager = (Manager) session.getAttribute("managerLogin");
	System.out.println("  << for debug >> in systemEnrolEvent:managerLogin = " + manager.getManagerId());
	
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	String discountRate = request.getParameter("discountRate");
	
	java.sql.Date sd = java.sql.Date.valueOf(startDate);
	java.sql.Date ed = java.sql.Date.valueOf(endDate);
	int dr = Integer.parseInt(discountRate);
	
	if(startDate.equals("") || endDate.equals("") || discountRate.equals("")) {
		out.print("<script>alert('����� �̺�Ʈ�� ������ ��� �Էµ��� �ʾҽ��ϴ�.')</script>");
	}
	
	Event enrolEvent = new Event(manager.getManagerNo(), sd, ed, dr);
	
	DB.insertEvent(enrolEvent);
	
	out.print("<script>alert('�̺�Ʈ ����� �Ϸ�Ǿ����ϴ�.')</script>");
	out.print("<script>window.location.href='javascript:history.back()'</script>");
	%>
</body>
</html>