package util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// �ؽ�Ʈ ���Ͽ��� �� �پ� �����ͺ��̽� ���̵�, ��й�ȣ�� �Է��Ͽ� �����մϴ�.
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