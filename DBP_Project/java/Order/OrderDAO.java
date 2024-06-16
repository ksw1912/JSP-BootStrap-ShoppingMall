package Order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import UserInfo.User;

public class OrderDAO {
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

	public void insert(String id,int totalPrice) {
		open();
		String sql = "INSERT INTO Orders(id,totalprice) values(?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, totalPrice);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

//	public void update(Orders u, HashMap<String, String> updates) {
//		open();
//		String sql = "UPDATE OrdersDB SET ";
//		try {
//			StringBuilder sb = new StringBuilder(sql);
//			List<String> keys = new ArrayList<>();
//			List<Object> values = new ArrayList<>();
//
//			for (HashMap.Entry<String, String> entry : updates.entrySet()) {
//				if (entry.getValue() != null && !entry.getValue().toString().isEmpty()) {
//					keys.add(entry.getKey() + " = ?");
//					values.add(entry.getValue());
//				}
//			}
//
//			sb.append(String.join(", ", keys));
//			sb.append(" WHERE id= ?");
//
//			pstmt = conn.prepareStatement(sb.toString());
//			for (int i = 0; i < values.size(); i++) {
//				pstmt.setObject(i + 1, values.get(i));
//			}
//			pstmt.setString(values.size() + 1, u.getId());
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//	}

//	public void delete(String OrdersId) {
//		open();
//		String sql = "DELETE FROM OrdersDB WHERE ID= ?";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, OrdersId);
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//	}
	
	public Orders find(String id) {
		open();
		Orders o = null;
		try {
			pstmt = conn.prepareStatement("select * from ORDERS where id = ? ORDER BY ORDERID DESC LIMIT 1");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				o = new Orders();
				o.setOrderId(rs.getInt("orderid"));
				o.setId(rs.getString("id"));
				o.setId(rs.getString("totalprice"));
				o.setOrderDate(rs.getString("orderprice"));
				o.setTotalPrice(rs.getString("orderDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return o;
	}
	
	public List<Orders> findUser(String id) {
		open();
		Orders o = null;
		List<Orders> ol = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement("select * from ORDERS where id = ?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				o = new Orders();
				o.setOrderId(rs.getInt("orderid"));
				o.setId(rs.getString("id"));
				o.setTotalPrice(rs.getString("totalprice"));
				o.setOrderDate(rs.getString("orderdate"));
				ol.add(o);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return ol;
	}

	public List<Orders> findAll() {
		open();
		List<Orders> Orders = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement("select * from Orders");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Orders u = new Orders();
				u.setOrderId(rs.getInt("orderid"));
				u.setId(rs.getString("id"));
				u.setTotalPrice(rs.getString("totalprice"));
				u.setOrderDate(rs.getString("orderdate"));
				Orders.add(u);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return Orders;
	}
}
