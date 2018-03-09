<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sofrative</title>
</head>

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body {
   background-color: white;
   font-family: 'jeju gothic', serif;
}
</style>

<body>

   <img src="images/logo.jpg"
      style="position: absolute; top: 0px; right: 10px" width="120px"
      height="80px">

   <%
     String memberid = request.getParameter("memberid");
     String name = request.getParameter("name");
     String name_decoded = URLDecoder.decode(name,"UTF-8");
  %>

   <div
      style="text-align: center; font-size: 15px; margin: 100px; 0px; 0px; 0px;">
      <form name="form"
         action="stuWriteAction.jsp?name=<%=name_decoded%>&memberid=<%=memberid%>"
         accept-charset="utf-8" name="MessageForm" method="post">
         <div>
            <p
               style="text-align: center; font-size: 25px; color: black; font-weight: bold;">
               <%= request.getParameter("name") %>
               교수님 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
                  style="width: 60px; height: 30px; background-color: #F4C290; font-size: 10px; border-radius: 15px; border-color: #F4C290"
                  type="submit" value="보내기" /> <input
                  style="width: 60px; height: 30px; background-color: #E7E3E3; font-size: 10px; border-radius: 15px; border-color: silver"
                  type="button" value="HOME"
                  onclick="location.href='initialScreen.jsp'" />
            </p>

         </div>

         <textarea
            style="margin: auto; border-color: #89D7C0; margin: 10px 0px 0px 0px;"
            name="message" cols="50" rows="25">
   </textarea>
         <br>
         <br>
      </form>
   </div>

</body>

</html>