package UserInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeliveryInfoDAO {
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

	 // 배송 정보 삽입
    public void insert(DeliveryInfo deliveryInfo) {
        open();
        try {
            String sql = "INSERT INTO DeliveryInfo (id, recipient, address, recipient_number) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, deliveryInfo.getId());
            pstmt.setString(2, deliveryInfo.getRecipient());
            pstmt.setString(3, deliveryInfo.getAddress());
            pstmt.setString(4, deliveryInfo.getRecipient_number());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }


    // 배송 정보 조회
    public DeliveryInfo select(String id) {
        DeliveryInfo deliveryInfo = null;
        open();
        try {
            String sql = "SELECT * FROM DeliveryInfo WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                deliveryInfo = new DeliveryInfo(
                    resultSet.getString("id"),
                    resultSet.getString("recipient"),
                    resultSet.getString("address"),
                    resultSet.getString("recipient_number")
                );
                deliveryInfo.setDeliveryNum(resultSet.getInt("deliveryNum"));
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return deliveryInfo;
    }

    // 배송 정보 업데이트
    public void update(DeliveryInfo deliveryInfo) {
        open();
        try {
            String sql = "UPDATE DeliveryInfo SET recipient = ?, address = ?, recipient_number = ? WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, deliveryInfo.getRecipient());
            pstmt.setString(2, deliveryInfo.getAddress());
            pstmt.setString(3, deliveryInfo.getRecipient_number());
            pstmt.setString(4, deliveryInfo.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }
}


