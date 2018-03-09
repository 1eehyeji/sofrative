<%@page import="sofrative.message.MessageDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sofrative</title>
</head>
<body>
<%
	MessageDB mdb = new MessageDB();
	String id = request.getParameter("memberid");
	
	mdb.deleteMessageAll(id);
	 %>
     <script>
        alert("메세지를 삭제했습니다.");
        document.location.href="TMessageForm.jsp?memberid=<%=id%>";
     </script>
</body>
</html>