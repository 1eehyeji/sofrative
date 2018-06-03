<%@page import="java.net.URLEncoder"%>
<%@page import="sfr.DB.DBUtil,sfr.user.*,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String dept = "그 외";
	String name_encoded = null;
	List<UserVO> list = UserDAO.getLoginProfListByDept(dept);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sofrative</title>
</head>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
<body>
<img src="images/logo.jpg" style="position: absolute; top:0px ;right:10px" width="120px" height="80px" >

<div style="text-align:center; margin:100px; 0px; 0px; 0px; ">
		<p style="font-size:25pt; color:#89D7C0; font-weight:bold;">그 외</p>
	

		<%
			for(UserVO u : list){
				name_encoded = URLEncoder.encode(u.getName());
		%>
			
			<a href="stuWriteForm.jsp?memberid=<%=u.getId() %>&name=<%=name_encoded%>"><%= u.getName() %> 교수님 </a><br>
 		<%
			}
		%>
	</div>
</body>
</html>