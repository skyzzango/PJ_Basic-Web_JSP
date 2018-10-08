package type03.util;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;

public class DBManager {

	private Connection conn = null;

	public Connection getConnection(String dbName) {
		try {
			if (dbName.equals("mysql")) {
				DataSource dataSource = (DataSource) new InitialContext()
						.lookup("java:comp/env/jdbc/mySql");
				conn = dataSource.getConnection();
			}
		} catch (Exception e) {
			System.err.println("mySQL Database Connection Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return conn;
	}
}
