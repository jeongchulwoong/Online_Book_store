<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>�α��� ó��</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	//�α��� Ÿ�� ��ȯ�� Ȯ�� �ʿ�**********************
	String type = request.getParameter("loginType");
	String ID = request.getParameter("idForLogin");
	String PW = request.getParameter("pwForLogin");
	
	if(ID.equals("") || PW.equals("")) {
		out.print("<script>alert('�α��� ���̵�� �н����尡 ��� �Էµ��� �ʾҽ��ϴ�.')</script>");
		
		out.print("<script>window.location.href='formForLogin.html'</script>");
	}
	
	
	if(type.equals("customer")) {
		Customer customerLogin = DB.getCustomer(ID, PW);
		System.out.println("  <<for debug >> loginID: '" + ID + "', loginPW='" + PW + "'\n");
		
		if(customerLogin == null) {
			out.print("<script>alert('���̵�: " + ID + ", �н�����: " + PW + " - �߸��� ���̵� �Ǵ� �н������Դϴ�.')</script>");
			out.print("<script>window.location.href='formForLogin.html'</script>");
		}
		else {
			System.out.println("  <<for debug >> �α����� ����� ���̵� : " + customerLogin.getCid() + ", ����� �̸�: " + customerLogin.getCname() + "\n");
			session.setAttribute("customerLogin", customerLogin);  // // ���� ��ü�� �α����� �� ��ü customerLogin�� �̸� "customerLogin"�� ����
			out.print("<script>window.top.location='systemAfterCustomerLogin.jsp'</script>");
		}
	}
	
	else if(type.equals("manager")){
		Manager managerLogin = DB.getManager(ID, PW);
		System.out.println("  <<for debug >> loginID: '" + ID + "', loginPW='" + PW + "'\n");
		
		if(managerLogin == null){
			out.print("<script>alert('���̵�: " + ID + ", �н�����: " + PW + " - �߸��� ���̵� �Ǵ� �н������Դϴ�.')</script>");
			out.print("<script>window.location.href='formForLogin.html'</script>");
		}
		else{
			System.out.println("  <<for debug >> �α����� �Ŵ��� ���̵� : " + managerLogin.getManagerId() + ", �Ŵ��� �̸�: " + managerLogin.getManagerName() + "\n");
			session.setAttribute("managerLogin", managerLogin);  
			out.print("<script>window.top.location='systemAfterManagerLogin.jsp'</script>");
		}
	}
	
	%>
</body>
</html>