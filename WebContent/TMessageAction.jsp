<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "sfr.user.UserDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sofrative</title>
</head>
<%
   UserDAO user = new UserDAO();
   
   String id = request.getParameter("memberid");

   boolean result = user.logout(id);
   //true면 LOGIN컬럼 값이 0으로 바뀌었다는 의미.
   
   if(result==false){
%>
	<script>
		alert("로그아웃 하는데 실패했습니다.");
		history.go(-1);
	</script>
<%      
   }   else{
%>
	<script>
		alert("로그아웃하셨습니다!");
		location.href="loginForm.jsp";
	</script>
<%
   }
%>   
<body>

</body>
</html>