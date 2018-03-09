package sofrative.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sofrative.DB.DBUtil;

//로그인  할 때 필요한 클래스 
public class LoginDB {
	
	private static LoginDB instance = new LoginDB();

	public static LoginDB getInstance() {
		return instance;
	}

	public int useCheck(String id, String pw) throws Exception {
		//사용자가 입력한 아이디, 비밀번호의 일치 여부에 따라 다른 값을 리턴하여 loginAction.jsp에서 팝업창을 다르게 띄운다.

		String orgid = id;
		String orgpw = pw;

		String dbpw = ""; //아이디, 비밀번호 일치 여부를 저장하는 변수 

		int value = -1;
		// -1: 아이디 없음    0:비번 틀림    1:맞음 을 리턴해서 상황에 맞는 팝업창을 띄운다.(loginAction.jsp)

		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//아이디,비밀번호 여부를 db에서 불러와서 비교하기 위한 객체들

		Connection connection2 = null;
		PreparedStatement stmt2 = null;
		ResultSet rs2 = null;
		//로그인한 객체의 LOGIN 컬럼의 값을 변경해주기 위한 (update)객체들 

		try {

			String query = "select * from member where binary(memberid)='" + orgid + "';";
			//입력한 아이디의 모든 컬럼을 조회하겠다.

			connection = DBUtil.getConnection();

			stmt = connection.prepareStatement(query);

			rs = stmt.executeQuery();

			if (rs.next()) {//아이디가 있을 경우

				dbpw = rs.getString("PASSWORD");
				//db에서 PASSWORD 컬럼을 가져와서 저장

				if (dbpw.equals(orgpw)) {
					//사용자가 입력한 비밀번호와 DB에 저장되어있는 비밀번호가 맞으면 

					value = 1; 

					try {//로그인하며 LOGIN 컬럼의 값을 0에서 1로 바꿔준다.

						String query2 = "update member set LOGIN=?, LOGIN_TIME=now() where MEMBERID='" + orgid + "'";

						connection2 = DBUtil.getConnection();

						stmt2 = connection2.prepareStatement(query2);

						stmt2.setString(1, "1");

						stmt2.executeUpdate();


					} catch (SQLException ex) {
						System.out.print(ex.getMessage());
						ex.printStackTrace();
					} finally {
						DBUtil.close(connection2);
						DBUtil.close(stmt2);
						DBUtil.close(rs2);
					}


				} else {
					//사용자가 입력한 비밀번호와 DB에 저장되어있는 비밀번호가 다를 경우
					value = 0;
				}


			} else {//사용자가 입력한 아이디가 존재하지 않을 경우
				value = -1;
			}

		} catch (SQLException ex) {
			System.out.print(ex.getMessage());
			ex.printStackTrace();
		} finally {
			DBUtil.close(connection);
			DBUtil.close(stmt);
			DBUtil.close(rs);
		}


		return value;
	}


}