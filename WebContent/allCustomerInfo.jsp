<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ���� ȣ�� �ý���</title>
</head>
<body>
         <%  
   	        request.setCharacterEncoding("euc-kr");
            
            String sno = (String) request.getParameter("sno");
  
	        ResultSet rs = DB.getAllCustomersRS();
	        
	        request.setAttribute("title", " ��� ���� ���� ��ȸ"); 	        
	        request.setAttribute("RS", rs); 
	        
	        request.getRequestDispatcher("listRS.jsp").forward(request, response);
      	 %> 
</body>
</html>