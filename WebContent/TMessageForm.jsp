<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="sofrative.DB.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="sofrative.message.MessageDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sofrative</title>
</head>

<body>
<%	String id = request.getParameter("memberid"); %>

   <form action="<%=request.getContextPath()%>/TMessageAction.jsp?memberid=<%=id%>"
      method="post">
      <div style="margin-top:40px">
         <span style="font-size:40px; font-family: 'jeju gothic', serif;
               ">메세지</span>
         <img src="images/logo.jpg"
            style="position: absolute; top: 0px; right: 10px" width="120px"
            height="80px"></img>
      </div>
      <div
         style="float: right; text-align: center; margin-left: 25px; margin-top:30px">
         <input type="button" value="새로고침"
            onclick="location.href='TMessageForm.jsp?memberid=<%=id%>'"
            style="width: 80px; height: 30px; font-size: 15px; border-radius: 15px;
            	background-color: #E7E3E3; border-color: #E7E3E3; font-family: 'jeju gothic', serif">
      		<input type="button" value="전체삭제" style="width: 80px; height: 30px; font-size: 15px; border-radius: 15px; 
            	background-color: #E7E3E3; border-color: #E7E3E3; font-family: 'jeju gothic', serif"
            	onclick="location.href='<%=request.getContextPath()%>/messageDelete.jsp?memberid=<%=id%>'">
            <input type="submit" value="LOGOUT" align="right"
            style="width: 80px; height: 30px; font-size: 15px; border-radius: 15px; 
            	background-color: #89D7C0; border-color: #89D7C0; font-family: 'jeju gothic', serif">
      	</div>
      	  </form>
      <div>
         <table>
            <tr>
               <td><span
                  style="font-size: 15px; align: center; padding-top: 10px">&nbsp;</span></td>
            </tr>
            <tr>
               <td><span
                  style="font-size: 15px; align: center; padding-top: 10px">&nbsp;</span></td>
            </tr>

         </table>
         <% 
            
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm");
            MessageDB msgNum = new MessageDB();

            int messageCount = msgNum.selectMessage(id);

            int count = request.getParameter("count") != null ? Integer.parseInt(request.getParameter("count")) : 1;

            //카운트 > 카운트메세지 
            if (count == 0) {
               count = 1;
            }

            if (messageCount != 0) {

               if (count > Math.ceil((double) messageCount / 5)) {
         %>
         <script>
            alert("마지막 페이지입니다.");
            history.go(-1);
         </script>
         <%
            }

            } else {
         %>
         <script>
            alert("존재하는 메세지가 없습니다.");
         </script>
         <%
            }
         %>
         <%
            int pageNumFirst = (count - 1) * 5;

            String stF = Integer.toString(pageNumFirst);

            String query2 = "delete from stumessage where memberid=? and mtime<=date_sub(now(), interval 3 hour)";
            String query = "select message, mtime from stumessage where memberid=? order by mtime desc limit @1,5;";
            String s = query.replace("@1", stF);

            Connection conn = DBUtil.getConnection();
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            Connection conn2 = DBUtil.getConnection();
            PreparedStatement pstmt2 = null;
            ResultSet rs2 = null;
            
            try{
                pstmt2 = conn2.prepareStatement(query2);
                 pstmt2.setString(1, id);
             pstmt2.executeUpdate();   
            
            }catch (SQLException ex) {
             System.out.print(ex.getMessage());
             ex.printStackTrace();
          } finally {
             DBUtil.close(conn2);
             DBUtil.close(pstmt2);
             DBUtil.close(rs2);
          }
            
            try {
        
               pstmt = conn.prepareStatement(s);
               pstmt.setString(1, id);
               rs = pstmt.executeQuery();
              

               while (rs.next()) {
                  String today = fmt.format(rs.getTimestamp("mtime"));
         %>
      </div>
      <div>
         <pre style="font-family: 'jeju gothic', serif"><%=today%></pre>
         <div style="margin-left: 150px">
            <pre style="font-family: 'jeju gothic', serif; font-size:12pt"><%=rs.getString("message")%></pre>
         </div>
         <hr />
      </div>
      <%
               }}catch (SQLException ex) {
         System.out.print(ex.getMessage());
         ex.printStackTrace();
      } finally {
         DBUtil.close(conn);
         DBUtil.close(pstmt);
         DBUtil.close(rs);
      }
      
      %>

   <form>
      <div style="text-align:center; margin-top:40px">
         <input type="button" value="이전"
            style="width: 80px; height: 30px; font-size: 15px; border-radius: 15px; 
            background-color: #F4C290; border-color: #F4C290; font-family: 'jeju gothic', serif"
            onclick="location.href='<%=request.getContextPath()%>/TMessageForm.jsp?count=<%=count - 1%>&memberid=<%=id%>'">
            &nbsp;&nbsp;&nbsp;&nbsp;
         <input type="button" value="다음"
            style="width: 80px; height: 30px; font-size: 15px; border-radius: 15px; 
            background-color: #F4C290; border-color: #F4C290; font-family: 'jeju gothic', serif"
            onclick="location.href='<%=request.getContextPath()%>/TMessageForm.jsp?count=<%=count + 1%>&memberid=<%=id%>'">
      </div>

   </form>
</body>
</html>