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
<img src="images/logo.jpg" style="position: absolute; top:0px ;right:10px" width="120px" height="80px"></img>
<div style="text-align:center; margin-top:100px;
   font-size: 40px; color:#89D7C0; font:bold; font-family:'jeju gothic', serif">
<h1>SOFRATIVE</h1><br/>
</div>

<form action="<%=request.getContextPath() %>/loginAction.jsp" method="post">
<div style="margin-top:10px; text-align:center; font-size:25px;
   color:gray; font:bold; font-family:'jeju gothic', serif;">

<table style="border:solid white; font-family:'jeju gothic', serif; " align="center"> 
 <tr>
 <td><span style="font-size: 20px; align:center; font-family:'jeju gothic', serif">ID</span></td>
 <td><input type="text" name="id" style="font-size:25px" ></td>
 </tr>
   <tr>
      <td><span style="font-size:15px; align:center; padding-top:10px">&nbsp;</span></td>
   </tr>
 <tr>
 <td><span style="font-size: 20px; align:center; padding-top:10px; font-family:'jeju gothic', serif">PW</span></td>
 <td><input type="password" name="pw" style="font-size:25px"></td>
 </tr>
</table>
</div>

<div style="float:midle; text-align:center; margin-left:25px;
   margin-top:35px">
<input type="submit" value="LOGIN" style="width:100px; height:40px; background-color:#F4C290; font-size:22px;
               border-radius:15px; border-color:#F4C290; margin-top:20px; font-family:'jeju gothic', serif">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
<input type="button" value="JOIN" onclick="location.href='joinForm.jsp'"
   style="width:100px; height:40px; background-color:#F4C290; font-size:22px;
               border-radius:15px; border-color:#F4C290; margin-top:20px; font-family:'jeju gothic', serif">
</div>
</form>

</body>
</html>