<%@page import="java.sql.PreparedStatement"%>
<%@page import="sofrative.DB.DBUtil"%>
<%@page import="java.sql.Connection"%>
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
body{
   background-color : white;
}
</style>
<body>
<%
	//로그인 후 5시간이 지난 멤버는 자동으로 로그아웃
	String query = "update member set login = 0 where login_time<=date_sub(now(), interval 5 hour)";
	
	Connection conn = DBUtil.getConnection();
	PreparedStatement pstmt = null;
	
	try{
		pstmt = conn.prepareStatement(query);
		pstmt.executeUpdate();
	}finally{
		DBUtil.close(conn);
		DBUtil.close(pstmt);
	}
%>

<img src="images/logo.jpg" style="position: absolute; top:0px ;right:10px" width="120px" height="80px"></img>

<div style="margin-top: 100pt; text-align:center">
   <span style="font-size:50px; font:bold; font-family:'jeju gothic', serif; color:#89D7C0">학부 선택</span>
</div>

<div style="margin-top:60px; text-align:center">
<input type="button" name="teacher" value="인문융합 자율 학부"
            onclick="location.href='liberalListForm.jsp'"
         style="width:300px; height:50px; background-color:#E7E3E3; font-size:20px;
                font-family:'jeju gothic', serif;
               border-radius:15px; border-color:#E7E3E3"/>        
</br>
<input type="button" name="teacher" value="사회융합 자율 학부"
            onclick="location.href='socialListForm.jsp'"
         style="width:300px; height:50px; background-color:#E7E3E3; font-size:20px;
         font-family:'jeju gothic', serif;
         border-radius:15px; border-color:#E7E3E3; margin-top:20px"/>
</br>
<input type="button" name="teacher" value="미디어컨텐츠융합 자율 학부"
            onclick="location.href='mediaListForm.jsp'"
         style="width:300px; height:50px; background-color:#E7E3E3; font-size:20px;
         font-family:'jeju gothic', serif;
         border-radius:15px; border-color:#E7E3E3; margin-top:20px"/>
</br>
<input type="button" name="teacher" value="IT융합 자율 학부"
            onclick="location.href='itListForm.jsp'"
         style="width:300px; height:50px; background-color:#E7E3E3; font-size:20px;
         font-family:'jeju gothic', serif;
         border-radius:15px; border-color:#E7E3E3; margin-top:20px"/>               
</br>
<input type="button" name="teacher" value="그 외"
            onclick="location.href='etcListForm.jsp'"
         style="width:300px; height:50px; background-color:#E7E3E3; font-size:20px;
         font-family:'jeju gothic', serif;
         border-radius:15px; border-color:#E7E3E3; margin-top:20px"/>
</div>



</body>
</html>