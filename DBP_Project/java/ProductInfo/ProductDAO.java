package ProductInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ProductDAO {
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

	public void insert(Product p) {
		open();
		String sql = "INSERT INTO Product(productid, pname, unitprice, description, manufacturer, category, unitsinstock, cond, productimg) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProductId());
			pstmt.setString(2, p.getPname());
			pstmt.setInt(3, p.getUnitPrice());
			pstmt.setString(4, p.getDescription());
			pstmt.setString(5, p.getManufacturer());
			pstmt.setString(6, p.getCategory());
			pstmt.setInt(7, p.getUnitsInStock());
			pstmt.setString(8, p.getCond());
			pstmt.setString(9, p.getProductImg());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void delete(String productId) {
		open();
		String sql = "DELETE FROM Product WHERE productid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void updateProductCount(Product p ) {
		open();
		String sql = "UPDATE PRODUCT SET UNITSINSTOCK = ? where productid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,p.getUnitsInStock());
			pstmt.setString(2,p.getProductId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 상품업데이트 특정상품에 특정 일부분만 수정도 가능하게 만듬
	public void update(Product p, HashMap<String, Object> updates) {
		open();
		String sql = "UPDATE PRODUCT SET ";
		try {
			StringBuilder sb = new StringBuilder(sql);
			List<String> keys = new ArrayList<>();
			List<Object> values = new ArrayList<>();

			for (HashMap.Entry<String, Object> entry : updates.entrySet()) {
				if (entry.getValue() != null && !entry.getValue().toString().isEmpty()) {
					keys.add(entry.getKey() + " = ?");
					values.add(entry.getValue());
				}
			}

			sb.append(String.join(", ", keys));
			sb.append(" WHERE productid= ?");

			pstmt = conn.prepareStatement(sb.toString());
			for (int i = 0; i < values.size(); i++) {
				pstmt.setObject(i + 1, values.get(i));
			}
			pstmt.setString(values.size() + 1, p.getProductId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public List<Product> search(String pname) {
		open();
		List<Product> p = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement("select * from Product where pname like ?");
			pstmt.setString(1, '%' + pname + '%');
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Product b = new Product();
				b.setProductId(rs.getString("productid"));
				b.setPname(rs.getString("pname"));
				b.setUnitPrice(rs.getInt("unitprice"));
				b.setDescription(rs.getString("description"));
				b.setManufacturer(rs.getString("manufacturer"));
				b.setCategory(rs.getString("category"));
				b.setUnitsInStock(rs.getInt("unitsinstock"));
				b.setCond(rs.getString("cond"));
				b.setProductImg(rs.getString("productimg"));

				p.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return p;
	}

	public Product find(String productId) {
		open();
		Product b = new Product();
		try {
			pstmt = conn.prepareStatement("select * from Product where productid = ?");
			pstmt.setString(1, productId);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			b.setProductId(rs.getString("productid"));
			b.setPname(rs.getString("pname"));
			b.setUnitPrice(rs.getInt("unitprice"));
			b.setDescription(rs.getString("description"));
			b.setManufacturer(rs.getString("manufacturer"));
			b.setCategory(rs.getString("category"));
			b.setUnitsInStock(rs.getInt("unitsinstock"));
			b.setCond(rs.getString("cond"));
			b.setProductImg(rs.getString("productimg"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return b;
	}

	public List<Product> findAll() {
		open();
		List<Product> products = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement("select * from Product");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Product b = new Product();
				b.setProductId(rs.getString("productid"));
				b.setPname(rs.getString("pname"));
				b.setUnitPrice(rs.getInt("unitprice"));
				b.setDescription(rs.getString("description"));
				b.setManufacturer(rs.getString("manufacturer"));
				b.setCategory(rs.getString("category"));
				b.setUnitsInStock(rs.getInt("unitsinstock"));
				b.setCond(rs.getString("cond"));
				b.setProductImg(rs.getString("productimg"));

				products.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return products;
	}

	public List<Product> findCond(String cond) {
		open();
		List<Product> products = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement("select * from Product where cond = ?");
			pstmt.setString(1, cond);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Product b = new Product();
				b.setProductId(rs.getString("productid"));
				b.setPname(rs.getString("pname"));
				b.setUnitPrice(rs.getInt("unitprice"));
				b.setDescription(rs.getString("description"));
				b.setManufacturer(rs.getString("manufacturer"));
				b.setCategory(rs.getString("category"));
				b.setUnitsInStock(rs.getInt("unitsinstock"));
				b.setCond(rs.getString("cond"));
				b.setProductImg(rs.getString("productimg"));

				products.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return products;
	}

}
