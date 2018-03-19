/*
 * 회원정보 삽입 쿼리 메소드
 * 아이디 중복 확인 메소드
 */
package sofrative.join;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sofrative.DB.DBUtil;
import sofrative.member.Member;

public class JoinDao {

	private final String PROF_PW = "1234skhu";
   public static JoinDao instance = new JoinDao();

   public static JoinDao getInstance() {
      return instance;
   }


   public void insert(Connection conn, Member member) throws SQLException{
      try (PreparedStatement pstmt = conn.prepareStatement(
            "insert into member values(?,?,?,?,?,?,?,null)")){
         pstmt.setString(1, member.getId());
         pstmt.setString(2, member.getPassword());
         pstmt.setString(3, member.getName());
         pstmt.setString(4, member.getDepartment());
         pstmt.setString(5, member.getEmail()+member.getUrl());
         pstmt.setString(6, member.getPhone());
         pstmt.setInt(7, 0);
         pstmt.executeUpdate();
      }
   }

   public int overlapId(String id) throws SQLException {
      Connection conn = DBUtil.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int check = 0;

      try {
         pstmt = conn.prepareStatement(
               "select password from member where memberid=?");
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();

         if(rs.next()) check = 1;
         
         else check = 0;
      }finally {
         DBUtil.close(conn);
         DBUtil.close(pstmt);
         DBUtil.close(rs);
      }
      return check;
   }
   
   public int checkProf(String pw) {
	   if(PROF_PW.equals(pw)) { 
		   return 1;
	   }
	   else {
		   return -1;
	   }
   }
   
}