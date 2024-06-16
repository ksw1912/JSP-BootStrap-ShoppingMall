package Order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ProductInfo.Product;

public class LockerDAO {
	Connection conn = null;
	PreparedStatement pstmt;

	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/ShoppingDB";

	public void open() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "ksw1912", "faith1918!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insert(Locker l) {
		open();
		String sql = "INSERT INTO LOCKER(id,productid) values(?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, l.getId());
			pstmt.setString(2, l.getProductId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	public void delete(Locker l) {
		open();
		String sql = "delete from LOCKER where id = ? and productid = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, l.getId());
			pstmt.setString(2, l.getProductId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
}
