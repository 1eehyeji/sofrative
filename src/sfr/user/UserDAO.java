package sfr.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sfr.DB.DBUtil;

public class UserDAO {
	private final String PROF_PW = "1234skhu";
	public static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}

	//각 학과에 로그인 상태인 교수님 목록
	public List<UserVO> getLoginProfListByDept(String dept){
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

	//로그인 상태 확인
	public String loginValue(String id){

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

	public boolean logout(String id) throws Exception{
		String sql = "update member set LOGIN=? where binary(memberid)=?";

		try (Connection conn =DBUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, "0");//id의 LOGIN컬럼의 값을 0으로 변경하겠다.DB에서 0은 F를 나머지 값들은 T로 나타낸다고,,, 아마,, 그랬음,, 
			pstmt.setString(2, id);
			int x = -1; //DB쿼리가 실행되었는지 알려주는 변수(1이면 실행된거임.)
			x = pstmt.executeUpdate();//변경 x에 저장되는 값은 쿼리를 실행했을 때 업데이트(정보가 수정된?)된 컬럼 갯수 (로 알고있음.) 

			//(한 개의 수정을 요청했으니까) 요청 된 컬럼 갯수가 1개라면
			if(x == 1) return true;
		}
		return false;
	}

	// 로그인 창에서 입력받은 아이디와 비밀번호를 검사
	public int passwordMatching(String id, String pw) throws Exception{
		String sql = "select * from member where binary(memberid)=?";

		try(Connection conn = DBUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			try(ResultSet rs = pstmt.executeQuery()){
				if(!rs.next()) return -1; //입력받은 아이디가 존재하지 않음
				else {
					if(!pw.equals(rs.getString("password"))) {
						return 0; //비밀번호가 일치하지 않음
					}
					return 1; // 아이디에 해당하는 비밀번호와 일치
				}
			}
		}
	}

	// 로그인에 성공하면(passwordMatching 값으로 1이 반환되면)
	// DB login칼럼을 1로변경, 로그인된 시간을 현재시간으로 변경
	public boolean login(String memberid) throws Exception{
		String sql = "update member set login=?, login_time=now() where memberid=?";

		try(Connection conn = DBUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, 1);
			pstmt.setString(2, memberid);
			int check = pstmt.executeUpdate(); //update된 레코드의 개수

			if(check == 1) return true;
		}
		return false;
	}

	//로그인 후 5시간이 지난 회원은 자동 로그아웃
	public void autoLogout() throws Exception{
		String sql = "update member set login=0 where login_time<=date_sub(now(), interval 5 hour)";
		
		try(Connection conn = DBUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.executeUpdate();
		}
	}
	
	// 회원가입 정보를 DB에 저장
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

	// 회원가입시 아이디가 중복인지 확인함
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

	// 회원가입시 교수님들만 알고있는 password로 학생이 회원가입을 하지 못하도록 검사
	public int checkProf(String pw) {
		if(PROF_PW.equals(pw)) { 
			return 1;
		}
		else {
			return -1;
		}
	}
}
