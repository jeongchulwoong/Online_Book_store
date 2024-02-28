<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,onlineBookstore.*, java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="listStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>���������� ������ ����</title>
</head>
<body>
	<script>
		function isCorrection(form) {
			var pw = document.getElementById("pwForCorrection").value;
			var checkPw = document.getElementById("checkPwForCorrection").value;
			var name = document.getElementById("nameForCorrection").value;
			var pn = document.getElementById("pnForCorrection").value;
			
			if(pw != checkPw) {
				alert("'PWȮ��'�� �������� �ʽ��ϴ�.");
			}
			else if(pw.length < 3) {
				if(pw.length == 0) {
					alert("PW�� �Է����ּ���.");
				}
				else {
					alert("PW�� 3�� �̻���� �����մϴ�.")
				}
				return false;
			}
			else if(name.length == 0 || name == "") {
				alert("�̸��� �Է����ּ���!!");
				return false;
			}
			else if(pn.length == 0 || pn == "") {
				alert("��ȭ��ȣ�� �Է����ּ���!!");
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
 		<tr><th id="blue" colspan="2">���� ����</th></tr>
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
 			<td width=40% align=right>PW Ȯ��</td>
 			<td width=60% align=center><input type="password" name="checkPwForCorrection" id="checkPwForCorrection" size="21"></td>
 		</tr>
 		<tr>
 			<td width=40% align=right>�̸�</td>
 			<td width=60% align=center><input type="text" name="nameForCorrection" id="nameForCorrection" value="<%= customer.getCname() %>" size="21"></td>
 		</tr>
 		<tr>
 			<td width=40% align=right>����ó</td>
 			<td width=60% align=center><input type="text" name="pnForCorrection" id="pnForCorrection" value="<%= customer.getCpn() %>" size="21"></td>
 		</tr>
 		<tr><td colspan="2" align=center><input type="submit" value="����"></td></tr>
 	</table>
 	</form>
</body>
</html>