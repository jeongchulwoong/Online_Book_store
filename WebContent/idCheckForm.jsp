<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>ID 중복 검사창</title>
</head>
<body>
	<div style="text-align: center">
	<h5>ID 중복 검사</h5>
	<form method=POST action="idCheckSystem.jsp" onsubmit="return idCount(this)">
	아이디 : <input type="text" name="idCheck">
	<input type="submit" value="중복확인">
	</form>
	</div>
	
	<script>
	function idCount(form) {
		var id=form.idCheck.value;
		id = id.trim();
		if(id.length<3) {
			alert("ID는 3자 이상부터 생성 가능합니다.");
			return false;
		}
		return true;
	}
	</script>
	
	
	
</body>
</html>