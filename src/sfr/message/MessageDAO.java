package sfr.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import sfr.DB.DBUtil;
import sfr.user.UserDAO;

public class MessageDAO {

	private static MessageDAO instance = new MessageDAO();

	public static MessageDAO getInstance() {
		return instance;
	}

	public boolean messageInsert(MessageVO msg) throws Exception{
		String login = UserDAO.getInstance().loginValue(msg.getMemberid()); //0: 로그아웃 되어있는 상태 1: 로그인이 되어있는 상태
		String sql ="insert into stuMessage values( ?, now(), ?)";

		if(login.equals("1")) {
			try(Connection conn = DBUtil.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, msg.getMemberid());
				pstmt.setString(2, msg.getMessage());
				int check = pstmt.executeUpdate();
				if(check == 1) return true;
			}
		}
		return false;
	}

	//매개변수로 받은 아이디에 해당하는 교수님 성함을 리턴
	public String getName(String id) throws Exception {
		String result = "";
		String sql = "select * from member where memberid=?";

		try(Connection conn = DBUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, id);
			try (ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					result = rs.getString("NAME");
				}
			}
			return result;
		}
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

			if(rs.next())
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

	public void deleteMessageByTime(String id) throws Exception{
		String sql = "delete from stumessage where memberid=? and mtime<=date_sub(now(), interval 3 hour)";

		try(Connection conn = DBUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}
	}

	//메세지 전송 시간 차이가 적은 순서대로 읽어옴
	public List<MessageVO> selectMessageByTime(String id, String pg) throws Exception{
		String s = "select message, mtime from stumessage where memberid=? order by mtime desc limit @1,5;";
		String sql = s.replace("@1", pg);

		try(Connection conn = DBUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			try(ResultSet rs = pstmt.executeQuery()){
				List<MessageVO> list = new ArrayList<MessageVO>();
				while(rs.next()) {
					MessageVO msg = new MessageVO();
					msg.setMemberid(rs.getString("memberid"));
					msg.setMessage(rs.getString("message"));
					msg.setMtime(rs.getTimestamp("mtime"));
					list.add(msg);
				}
				return list;
			}
		}
	}


}