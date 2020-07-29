package util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 텍스트 파일에는 한 줄씩 데이터베이스 아이디, 비밀번호를 입력하여 관리합니다.
			String dbURL = "jdbc:mysql://localhost:3306/soho?"+
							"useSSL=false&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "gustjr5";
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}