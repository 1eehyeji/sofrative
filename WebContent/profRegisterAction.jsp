<%@page import="sfr.user.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		String prof_pw = request.getParameter("ProfPw");

		int result = UserDAO.checkProf(prof_pw);
		//result가 -1이면 비번 틀림, 1이면 회원가입창으로 넘어갈 수 있음

		if (result == 1) {
	%>
	<script>
		alert("확인되었습니다!");
		location.href = "joinForm.jsp";
	</script>
	<%
		} else if (result == -1) {
	%>
	<script>
		alert("등록번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
	<%
		}
	%>

</body>
</html>