<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>å ���� ȣ�� �ý���</title>
</head>
<body>
         <%  
         request.setCharacterEncoding("euc-kr");

     	ResultSet rs = DB.getAllBooksRS();

     	int cnt = DB.getNoTuplesRS(rs);

     	if (cnt == 0) {
     		out.print("<script>alert('��ϵ� ������ �ϳ��� �����ϴ�.')</script>");
     	} else {
     		request.setAttribute("title", "��� ���� ����Ʈ");

     		request.setAttribute("RS", rs);
     		request.getRequestDispatcher("listRS.jsp").forward(request, response);
     	}
      	 %> 
</body>
</html>