package Order;

import java.util.ArrayList;

public class OrderRepository {
	ArrayList<OrderInfo> OrderList = new ArrayList<>();
	
	
	public void addOrder(OrderInfo orderinfo) {
		OrderList.add(orderinfo);
	}
}
