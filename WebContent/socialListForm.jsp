<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="sofrative.DB.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<img src="images/logo.jpg"
		style="position: absolute; top: 0px; right: 10px" width="120px"
		height="80px">

	<div style="text-align: center; margin: 100px; 0px; 0px; 0px; ">
		<p style="font-size: 25pt; color: #89D7C0; font-weight: bold;">사회융합
			자율 학부</p>


		<%
			String dept = "사회융합 자율학부";

			ResultSet rs = null;
			Connection conn = DBUtil.getConnection();

			try (PreparedStatement pstmt = conn.prepareStatement(//and department = ?
					"select name, memberid from member where login = ? and department = ? ")) {
				pstmt.setInt(1, 1);
				pstmt.setString(2, dept);
				rs = pstmt.executeQuery();

				while (rs.next()) {

					String memberid = rs.getString("memberid");
					String name = rs.getString("name");
					String name_encoded = URLEncoder.encode(name);
		%>
		<a href="stuWriteForm.jsp?memberid=<%=memberid%>&name=<%=name%>"><%=name%> 교수님</a><br>
		<br>

		<%
			//session.setAttribute("NAME", rs.getString("name"));
				}
			}

			DBUtil.close(conn);
			DBUtil.close(rs);
		%>
	</div>
</body>
</html>