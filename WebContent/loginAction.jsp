<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="sfr.user.*"%>

<%
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   
   
   int result = UserDAO.passwordMatching(id, pw);
	
   
 	//result가 -1이면 아이디 없음 0이면 비번 틀림 1이면 로그인
   if(result==0){ 
%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
<% 
   }else if(result == 1){ 
	   
	   UserDAO.login(id);
	
%>
  	<script>
  		alert("로그인되었습니다!");
  		document.location.href="TMessageForm.jsp?memberid=<%=id%>";
  	</script>
<%
      
   }else if(result == -1){
%>
	<script>
		alert("해당 아이디가 존재하지 않습니다.");
		history.go(-1);
	</script>
<%
   }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sofrative</title>
</head>
<body>

</body>
</html>