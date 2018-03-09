package sofrative.login;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sofrative.DB.DBUtil;

//로그아웃 할 때 필요한 클래스 
public class LogoutDB {

	private static LogoutDB instance = new LogoutDB();

	public static LogoutDB getInstance() {
		return instance;
	}

	public boolean logoutCheck(String id) throws Exception {
		//아이디가 현재 로그인 상태인지 확인하고 아니면 로그아웃 중입니다?(일단 배제)
		//boolean 변수를 리턴하여 true이면 로그아웃 되었다는 의미이고(db에서 LOGIN컬럼의 값을 0으로 바꾸는데 성공했으면) false이면 로그아웃에 실패했다는 의미

		String memberId = id; 
		boolean result = false;
		int x = -1; //DB쿼리가 실행되었는지 알려주는 변수(1이면 실행된거임.)

		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;


		try {
			String query="update member set LOGIN=? where MEMBERID='" + id + "'";

			connection = DBUtil.getConnection();

			stmt = connection.prepareStatement(query);

			stmt.setString(1, "0");//id의 LOGIN컬럼의 값을 0으로 변경하겠다.DB에서 0은 F를 나머지 값들은 T로 나타낸다고,,, 아마,, 그랬음,, 

			x = stmt.executeUpdate();//변경
			//x에 저장되는 값은 쿼리를 실행했을 때 업데이트(정보가 수정된?)된 컬럼 갯수 (로 알고있음.) 

			if(x==1) {//(한 개의 수정을 요청했으니까) 요청 된 컬럼 갯수가 1개라면 
				result = true;
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

}