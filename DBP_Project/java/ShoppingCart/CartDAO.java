package ShoppingCart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import ProductInfo.Product;
import UserInfo.User;

public class CartDAO {
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

	// user 장바구니 수량 update
	public void update(Cart c) {
		open();
		String sql = "UPDATE CART SET cartincount = ? where id = ? and productid =? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCartInCount());
			pstmt.setString(2, c.getuserId());
			pstmt.setString(3, c.getProductId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void delete(String userId, String productId) {
		open();
		String sql = "DELETE FROM CART WHERE ID = ? and PRODUCTID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, productId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public List<CartItems> findAll(String id) {
		open();
		List<CartItems> productList = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(
					"select p.productid,p.pname,p.unitprice,p.description, p.manufacturer, p.category ,p.unitsinstock, cond,p.productimg, c.CARTINCOUNT from product p ,cart c where p.productid = c.productid and c.id = ?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				CartItems cart = new CartItems();
				p.setProductId(rs.getString("productid"));
				p.setPname(rs.getString("pname"));
				p.setUnitPrice(rs.getInt("unitprice"));
				p.setDescription(rs.getString("description"));
				p.setManufacturer(rs.getString("manufacturer"));
				p.setCategory(rs.getString("category"));
				p.setUnitsInStock(rs.getInt("unitsinstock"));
				p.setCond(rs.getString("cond"));
				p.setProductImg(rs.getString("productimg"));
				cart.setCartInCount(rs.getInt("CARTINCOUNT"));
				cart.setProduct(p);
				productList.add(cart);
			}

			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return productList;
	}

	public void insert(Cart c) {
		open();
		String sql = "INSERT INTO cart(id,productid,cartincount) values(?, ?, ?);";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getuserId());
			pstmt.setString(2, c.getProductId());
			pstmt.setInt(3, c.getCartInCount());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public Cart find(String userId, String productId) {
		open();
		String sql = "select * from cart where id= ? and productid = ?";
		Cart cart = new Cart();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, productId);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			cart.setCartInCount(rs.getInt("CARTINCOUNT"));
			cart.setProductId(rs.getString("productid"));
			cart.setuserId(rs.getString("id"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cart;
	}
	
	public void delete(String id){
		open();
		String sql = "DELETE FROM cart WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
}
