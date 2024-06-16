package Order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ProductInfo.Product;
import ShoppingCart.CartItems;
import UserInfo.User;

public class OrderListDAO {
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

	public void insert(CartItems c, Integer orderId) {
		open();
		String sql = "INSERT INTO orderlist(ORDERID,PRODUCTID,PRODUCTCOUNT,ORDERSTATUS) values(?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderId);
			pstmt.setString(2, c.getProduct().getProductId());
			pstmt.setInt(3, c.getCartInCount());
			pstmt.setString(4, "Waiting for seller approval");
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public List<OrderList> findOrderId(Integer orderid) {
		open();
		OrderList o = null;
		List<OrderList> ol = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement("select * from OrderList where orderid = ?");
			pstmt.setInt(1, orderid);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				o = new OrderList();
				o.setOrderId(rs.getInt("orderid"));
				o.setProductId(rs.getString("productId"));
				o.setProductCount(rs.getInt("productcount"));
				o.setOrderStatus(rs.getString("orderStatus"));
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
	
	public List<OrderList> findAll(){
		List<OrderList> ol = new ArrayList<>();
		String sql ="select * from ORDERLIST;";
		open();
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderList o = new OrderList();
				o.setOrderId(rs.getInt("ORDERID"));
				o.setProductId(rs.getString("productid"));
				o.setProductCount(rs.getInt("PRODUCTCOUNT"));
				o.setOrderStatus(rs.getString("ORDERSTATUS"));
				ol.add(o);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return ol; 
	}	
	public void updateDelivery(String productId, Integer orderId, String orderstatus) {
		open();
		String sql = "update orderlist set orderstatus = ? where productid =? and orderid =?;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderstatus);
			pstmt.setString(2, productId);
			pstmt.setInt(3, orderId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
}
