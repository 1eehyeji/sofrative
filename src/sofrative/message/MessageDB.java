package sofrative.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import sofrative.DB.DBUtil;

public class MessageDB {

	private static MessageDB instance = new MessageDB();

	public static MessageDB getInstance() {
		return instance;
	}

	public boolean messageInsert(String id, String message) throws Exception{

		final int LOGIN = 1; //0: 로그아웃 되어있는 상태 1: 로그인이 되어있는 상태
		int dbLogin = 0;

		boolean result = false;

		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null; 

		Connection connection2 = null;
		PreparedStatement stmt2 = null;
		ResultSet rs2 = null; 

		int check = 0;
		//1. 로그인 여부 확인하고 2.메세지 보내기

		try {
			String query = "select * from member where memberid='" + id + "';";

			connection = DBUtil.getConnection();

			stmt = connection.prepareStatement(query);

			rs = stmt.executeQuery();

			if(rs.next()) {

				dbLogin = rs.getInt("LOGIN");

				if(LOGIN == dbLogin) {

					try {
						String query2 ="insert into stuMessage values('" + id + "', now(), '" + message + " '); ";

						connection2 = DBUtil.getConnection();

						stmt2 = connection2.prepareStatement(query2);

						check = stmt2.executeUpdate();

						if(check == 1) {

							result = true;
						}

					}catch (SQLException ex) {
						System.out.print(ex.getMessage());
						ex.printStackTrace();
					} finally {
						DBUtil.close(connection2);
						DBUtil.close(stmt2);
						DBUtil.close(rs2);
					}
				}
			}
		}catch (SQLException ex) {
			System.out.print(ex.getMessage());
			ex.printStackTrace();
		} finally {
			DBUtil.close(connection);
			DBUtil.close(stmt);
			DBUtil.close(rs);
		}

		return result;
	}

	public String getName(String id) throws Exception {//교수님 이름 리턴
		String result = "";

		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String query = "select * from member where memberid='" + id + "';";

			connection = DBUtil.getConnection();

			stmt = connection.prepareStatement(query);

			rs = stmt.executeQuery();

			if(rs.next()) {
				result = rs.getString("NAME");
			}
		}catch (SQLException ex) {
			System.out.print(ex.getMessage());
			ex.printStackTrace();
		} finally {
			DBUtil.close(connection);
			DBUtil.close(stmt);
			DBUtil.close(rs);
		}

		return result;
	}

	public String loginValue(String id){

		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String result = "";

		try {
			String query = "select * from member where memberid='" + id + "';";

			connection = DBUtil.getConnection();

			stmt = connection.prepareStatement(query);

			rs = stmt.executeQuery();

			if(rs.next()) {
				return result = rs.getString("LOGIN"); //로그인되어있으면 1 아니면 0
			}
		}catch (SQLException ex) {
			System.out.print(ex.getMessage());
			ex.printStackTrace();
		} finally {
			DBUtil.close(connection);
			DBUtil.close(stmt);
			DBUtil.close(rs);
		}

		return result;
	}

	public int selectMessage(String id) throws SQLException { //메세지 개수 리턴
		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null; 
		int result = 0;
		String query = "select count(*) from stumessage where memberid='" + id + "'";

		connection = DBUtil.getConnection();
		try {
			stmt = connection.prepareStatement(query);

			rs = stmt.executeQuery();

			rs.next();
			
			
			
			result =rs.getInt(1); //총 글의 갯수를 리턴하는 메소드 
			
			

		}
		catch (SQLException ex) {
			System.out.print(ex.getMessage());
			ex.printStackTrace();
		} finally {
			DBUtil.close(connection);
			DBUtil.close(stmt);
			DBUtil.close(rs);
		}
		return result;
	}
	
	public void deleteMessageAll(String id) throws SQLException{
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		
		String query = "delete from stumessage where memberid='" + id + "'";
		
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(query);
		}finally {
			DBUtil.close(conn);
			DBUtil.close(stmt);
		}
	}
	
}