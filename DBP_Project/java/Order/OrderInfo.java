package Order;

import java.util.List;

public class OrderInfo {
    private String orderDate;
    private List<OrderList> orderDetails;
    private String userId;

    public OrderInfo(String orderDate, List<OrderList> orderDetails) {
        this.orderDate = orderDate;
        this.orderDetails = orderDetails;
    }
    public OrderInfo(String orderDate, String userId,List<OrderList> orderDetails) {
        this.orderDate = orderDate;
        this.orderDetails = orderDetails;
        this.userId = userId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public List<OrderList> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderList> orderDetails) {
        this.orderDetails = orderDetails;
    }
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
