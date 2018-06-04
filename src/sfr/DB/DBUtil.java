/*
 * getConnection()메소드 : 커넥션 연결을 위한 메소드  
 * close() 메소드 : close를 위한 메소드
 * rollback() 메소드 : rollback을 위한 메소드
 */
package sfr.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {

	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/sofrative?" +
					"useUnicode=true&characterEncoding=utf8";
			String user = "root";
			String password = "1234";
			conn = DriverManager.getConnection(url, user, password);
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버가 없습니다.");
		}catch(SQLException e) {
			System.out.println("사용자 계정 또는 비밀번호가 일치하지 않습니다.");
		}
		return conn;
	}
	public static void close(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			}catch(SQLException ex) {
				
			}
		}
	}
	public static void close(Statement stmt) {
		if(stmt != null) {
			try {
				stmt.close();
			}catch(SQLException ex) {
				
			}
		}
	}
	public static void close(Connection conn) {
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException ex) {
				
			}
		}
	}
	public static void rollback(Connection conn) {
		if(conn != null) {
			try {
				conn.rollback();
			}catch(SQLException ex) {
				
			}
		}
	}
}
