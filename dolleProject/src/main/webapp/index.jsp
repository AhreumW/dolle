<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Spring</title>
<script type="text/javascript">
	function loginMoveFnc(){
		var formObj = document.getElementById('simpleForm');
		
		formObj.submit();
	}
</script>
</head>
<body>

	Hello Dolle..

	<form action="auth/login.do" id='simpleForm' method="get">
	
		<input type="button"  
			value="로그인 화면으로 이동" onclick="loginMoveFnc();">
	</form>
</body>
</html>