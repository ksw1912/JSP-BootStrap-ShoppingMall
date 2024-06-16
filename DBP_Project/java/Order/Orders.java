package Order;

public class Orders {
	private Integer orderId;
	private String id;
	private String totalPrice;
	private String orderDate;

	public Orders() {
	}

	Orders(Integer orderId, String id, String totalPrice, String orderDate) {
		this.orderId = orderId;
		this.id = id;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

}