package UserInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class UserDAO {
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

	public void insert(User u) {
		open();
		String sql = "INSERT INTO USERDB(ID,PW,NAME,NUMBER) values(?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getId());
			pstmt.setString(2, u.getPw());
			pstmt.setString(3, u.getName());
			pstmt.setString(4, u.getNumber());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void update(User u, HashMap<String, String> updates) {
		open();
		String sql = "UPDATE USERDB SET ";
		try {
			StringBuilder sb = new StringBuilder(sql);
			List<String> keys = new ArrayList<>();
			List<Object> values = new ArrayList<>();

			for (HashMap.Entry<String, String> entry : updates.entrySet()) {
				if (entry.getValue() != null && !entry.getValue().toString().isEmpty()) {
					keys.add(entry.getKey() + " = ?");
					values.add(entry.getValue());
				}
			}

			sb.append(String.join(", ", keys));
			sb.append(" WHERE id= ?");

			pstmt = conn.prepareStatement(sb.toString());
			for (int i = 0; i < values.size(); i++) {
				pstmt.setObject(i + 1, values.get(i));
			}
			pstmt.setString(values.size() + 1, u.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void delete(String userId) {
		open();
		String sql = "DELETE FROM USERDB WHERE ID= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	

	public User find(String id) {
		open();
		User u = new User();

		try {
			pstmt = conn.prepareStatement("select * from userdb where id = ?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			//id 정보가 존재하지않을 때 null처리 
			if(rs.next()) {
			u.setId(rs.getString("id"));
			u.setPw(rs.getString("pw"));
			u.setName(rs.getString("name"));
			u.setNumber(rs.getString("number"));
			}
			else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return u;
	}
	
	public List<User> findAll() {
		open();
		List<User> users = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement("select * from userdb");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				User u = new User();
				u.setId(rs.getString("id"));
				u.setPw(rs.getString("pw"));
				u.setName(rs.getString("name"));
				u.setNumber(rs.getString("number"));

				users.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return users;
	}
}
