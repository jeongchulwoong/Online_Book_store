<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>로그인 처리</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	
	//로그인 타입 반환값 확인 필요**********************
	String type = request.getParameter("loginType");
	String ID = request.getParameter("idForLogin");
	String PW = request.getParameter("pwForLogin");
	
	if(ID.equals("") || PW.equals("")) {
		out.print("<script>alert('로그인 아이디와 패스워드가 모두 입력되지 않았습니다.')</script>");
		
		out.print("<script>window.location.href='formForLogin.html'</script>");
	}
	
	
	if(type.equals("customer")) {
		Customer customerLogin = DB.getCustomer(ID, PW);
		System.out.println("  <<for debug >> loginID: '" + ID + "', loginPW='" + PW + "'\n");
		
		if(customerLogin == null) {
			out.print("<script>alert('아이디: " + ID + ", 패스워드: " + PW + " - 잘못된 아이디 또는 패스워드입니다.')</script>");
			out.print("<script>window.location.href='formForLogin.html'</script>");
		}
		else {
			System.out.println("  <<for debug >> 로그인한 은행원 아이디 : " + customerLogin.getCid() + ", 은행원 이름: " + customerLogin.getCname() + "\n");
			session.setAttribute("customerLogin", customerLogin);  // // 세션 객체에 로그인한 고객 객체 customerLogin를 이름 "customerLogin"로 저장
			out.print("<script>window.top.location='systemAfterCustomerLogin.jsp'</script>");
		}
	}
	
	else if(type.equals("manager")){
		Manager managerLogin = DB.getManager(ID, PW);
		System.out.println("  <<for debug >> loginID: '" + ID + "', loginPW='" + PW + "'\n");
		
		if(managerLogin == null){
			out.print("<script>alert('아이디: " + ID + ", 패스워드: " + PW + " - 잘못된 아이디 또는 패스워드입니다.')</script>");
			out.print("<script>window.location.href='formForLogin.html'</script>");
		}
		else{
			System.out.println("  <<for debug >> 로그인한 매니저 아이디 : " + managerLogin.getManagerId() + ", 매니저 이름: " + managerLogin.getManagerName() + "\n");
			session.setAttribute("managerLogin", managerLogin);  
			out.print("<script>window.top.location='systemAfterManagerLogin.jsp'</script>");
		}
	}
	
	%>
</body>
</html>