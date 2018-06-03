package sfr.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sfr.DB.DBUtil;

public class UserDAO {
	private final static String PROF_PW = "1234skhu";
	public static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}

	//媛� �븰怨쇱뿉 濡쒓렇�씤 �긽�깭�씤 援먯닔�떂 紐⑸줉
	public static List<UserVO> getLoginProfListByDept(String dept){
		String s = dept;

		Connection conn = DBUtil.getConnection();
		ResultSet rs = null;
		List<UserVO> list = new ArrayList<>();

		try (PreparedStatement pstmt = conn.prepareStatement(
				"select name, memberid from member where login = ? and department = ? ")) {
			pstmt.setInt(1, 1);
			pstmt.setString(2, s);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserVO user = new UserVO();
				user.setId(rs.getString("memberid"));
				user.setName(rs.getString("name"));
				list.add(user);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(conn);
			DBUtil.close(rs);
		}
		return list;
	}

	//濡쒓렇�씤 �긽�깭 �솗�씤
	public static String loginValue(String id){

		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String result = "0";

		try {
			String query = "select * from member where memberid='" + id + "';";

			connection = DBUtil.getConnection();

			stmt = connection.prepareStatement(query);

			rs = stmt.executeQuery();

			if(rs.next()) {
				return result = rs.getString("LOGIN"); //濡쒓렇�씤�릺�뼱�엳�쑝硫� 1 �븘�땲硫� 0
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

	public boolean logout(String id) throws Exception{
		String sql = "update member set LOGIN=? where binary(memberid)=?";

		try (Connection conn =DBUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, "0");//id�쓽 LOGIN而щ읆�쓽 媛믪쓣 0�쑝濡� 蹂�寃쏀븯寃좊떎.DB�뿉�꽌 0�� F瑜� �굹癒몄� 媛믩뱾�� T濡� �굹���궦�떎怨�,,, �븘留�,, 洹몃옱�쓬,, 
			pstmt.setString(2, id);
			int x = -1; //DB荑쇰━媛� �떎�뻾�릺�뿀�뒗吏� �븣�젮二쇰뒗 蹂��닔(1�씠硫� �떎�뻾�맂嫄곗엫.)
			x = pstmt.executeUpdate();//蹂�寃� x�뿉 ���옣�릺�뒗 媛믪� 荑쇰━瑜� �떎�뻾�뻽�쓣 �븣 �뾽�뜲�씠�듃(�젙蹂닿� �닔�젙�맂?)�맂 而щ읆 媛��닔 (濡� �븣怨좎엳�쓬.) 

			//(�븳 媛쒖쓽 �닔�젙�쓣 �슂泥��뻽�쑝�땲源�) �슂泥� �맂 而щ읆 媛��닔媛� 1媛쒕씪硫�
			if(x == 1) return true;
		}
		return false;
	}

	// 濡쒓렇�씤 李쎌뿉�꽌 �엯�젰諛쏆� �븘�씠�뵒�� 鍮꾨�踰덊샇瑜� 寃��궗
	public static int passwordMatching(String id, String pw) throws Exception{
		String sql = "select * from member where binary(memberid)=?";

		try(Connection conn = DBUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			try(ResultSet rs = pstmt.executeQuery()){
				if(!rs.next()) return -1; //�엯�젰諛쏆� �븘�씠�뵒媛� 議댁옱�븯吏� �븡�쓬
				else {
					if(!pw.equals(rs.getString("password"))) {
						return 0; //鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�쓬
					}
					return 1; // �븘�씠�뵒�뿉 �빐�떦�븯�뒗 鍮꾨�踰덊샇�� �씪移�
				}
			}
		}
	}

	// 濡쒓렇�씤�뿉 �꽦怨듯븯硫�(passwordMatching 媛믪쑝濡� 1�씠 諛섑솚�릺硫�)
	// DB login移쇰읆�쓣 1濡쒕�寃�, 濡쒓렇�씤�맂 �떆媛꾩쓣 �쁽�옱�떆媛꾩쑝濡� 蹂�寃�
	public boolean login(String memberid) throws Exception{
		String sql = "update member set login=?, login_time=now() where memberid=?";

		try(Connection conn = DBUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, 1);
			pstmt.setString(2, memberid);
			int check = pstmt.executeUpdate(); //update�맂 �젅肄붾뱶�쓽 媛쒖닔

			if(check == 1) return true;
		}
		return false;
	}

	//濡쒓렇�씤 �썑 5�떆媛꾩씠 吏��궃 �쉶�썝�� �옄�룞 濡쒓렇�븘�썐
	public void autoLogout() throws Exception{
		String sql = "update member set login=0 where login_time<=date_sub(now(), interval 5 hour)";
		
		try(Connection conn = DBUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.executeUpdate();
		}
	}
	
	// �쉶�썝媛��엯 �젙蹂대�� DB�뿉 ���옣
	public void insert(Connection conn, UserVO member) throws SQLException{
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

	// �쉶�썝媛��엯�떆 �븘�씠�뵒媛� 以묐났�씤吏� �솗�씤�븿
	public static int overlapId(String id) throws SQLException {
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

	// �쉶�썝媛��엯�떆 援먯닔�떂�뱾留� �븣怨좎엳�뒗 password濡� �븰�깮�씠 �쉶�썝媛��엯�쓣 �븯吏� 紐삵븯�룄濡� 寃��궗
	public static int checkProf(String pw) {
		if(PROF_PW.equals(pw)) { 
			return 1;
		}
		else {
			return -1;
		}
	}
}
