<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>Add Customer</h1>

	<form method="post" action="add">
		<table>
			<tr>
				<td>UserName :</td>
				<td><input type="text" style="width: 185px;" maxlength="30"
					name="name" id="name" /></span></td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><input type="text" style="width: 185px;" maxlength="30"
					name="email" id="email" /></span></td>
			</tr>
		</table>
		<input type="submit" class="save" title="Save" value="Save" />
	</form>

</body>
</html>