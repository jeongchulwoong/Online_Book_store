<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>매니저 로그인 후 메뉴</title>
	<style>
	html, body{height:100%;}
	
	.afterLoginMenu {
		float:center;
		width:100%;
		height:90px;
    }
    .controlBox {
    	float:center;
    	width:100%;
    	height:20%;
    }
    .bottomContent {
    	float:center;
    	width:100%;
    	height:100%;
    }
	</style>
</head>
<body>
	<iframe class="afterLoginMenu" src=buttonAfterManagerLogin.jsp name=iframeAfterLoginButton></iframe>
	<iframe class="controlBox" src=controlBox.html name=iframeSearchBox></iframe>
	<iframe class="bottomContent" src="managerMyInfo.jsp" name=iframeContent></iframe>
</body>
</html>