<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="listStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>마이페이지 고객정보 수정</title>
</head>
<body>
	<script>
		function isCorrection(form) {
			var pw = document.getElementById("pwForCorrection").value;
			var checkPw = document.getElementById("checkPwForCorrection").value;
			var name = document.getElementById("nameForCorrection").value;
			var pn = document.getElementById("pnForCorrection").value;
			
			if(pw != checkPw) {
				alert("'PW확인'이 동일하지 않습니다.");
			}
			else if(pw.length < 3) {
				if(pw.length == 0) {
					alert("PW를 입력해주세요.");
				}
				else {
					alert("PW는 3자 이상부터 가능합니다.")
				}
				return false;
			}
			else if(name.length == 0 || name == "") {
				alert("이름을 입력해주세요!!");
				return false;
			}
			else if(pn.length == 0 || pn == "") {
				alert("전화번호를 입력해주세요!!");
				return false;
			}
			else {
				return true;
			}
		}
	</script>
	<%
    Customer customer = (Customer) session.getAttribute("customerLogin"); 
    System.out.println("  << for debug >> in customerInfoCorrection:customerLogin = " + customer.getCid());
 	%>
 	<br>
 	<h2 align=center>Modify Info</h2>
 	<form name="correctionForm" method=POST action="systemInfoCorrection.jsp" onsubmit="return isCorrection(this)">
 	<table align=center valign=top border="0" cellpadding="8" cellspacing="0" bordercolor="#999999">
 		<tr><th id="blue" colspan="2">정보 수정</th></tr>
 		<tr><td colspan="2" height=20></td></tr>
 		<tr>
 			<td width=40% align=right>ID</td>
 			<td width=60% align=center><%= customer.getCid() %></td>
 		</tr>
 		<tr>
 			<td width=40% align=right>PW</td>
 			<td width=60% align=center><input type="password" name="pwForCorrection" id="pwForCorrection" size="21"></td>
 		</tr>
 		<tr>
 			<td width=40% align=right>PW 확인</td>
 			<td width=60% align=center><input type="password" name="checkPwForCorrection" id="checkPwForCorrection" size="21"></td>
 		</tr>
 		<tr>
 			<td width=40% align=right>이름</td>
 			<td width=60% align=center><input type="text" name="nameForCorrection" id="nameForCorrection" value="<%= customer.getCname() %>" size="21"></td>
 		</tr>
 		<tr>
 			<td width=40% align=right>연락처</td>
 			<td width=60% align=center><input type="text" name="pnForCorrection" id="pnForCorrection" value="<%= customer.getCpn() %>" size="21"></td>
 		</tr>
 		<tr><td colspan="2" align=center><input type="submit" value="수정"></td></tr>
 	</table>
 	</form>
</body>
</html>