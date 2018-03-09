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
background-color:white;
color:#89D7C0;
}m 
</style>
<body>

<img src="images/logo.jpg" style="position: absolute; top:0px; right:10px" width="120px" height="80px" >

<div style="text-align:center; margin:100px 0px 0px 0px; font-size:50px; font-weight:bold; font-family:'jeju gothic', serif">
   <h1>SOFRATIVE</h1>
</div>

<div style="text-align:center; margin:120px 0px 0px 0px">

   <input type="button" name="teacher" value="Teacher"
            onclick="location.href='loginForm.jsp'"
         style="width:130px; height:40px; background-color:#F4C290; font-size:22px;
               border-radius:15px; border-color:#F4C290; font-style:'jeju gothic'"/>
               
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

   <input type="button" name="students" value="Students"
      onclick="location.href='DepartmentSelect.jsp'"
         style="width:130px; height:40px; background-color:#F4C290; font-size:22px;
               border-radius:15px; border-color:#F4C290; font-style:'jeju gothic'"/>
</div>

</body>
</html>