package Order;

public class Locker {
	String id;
	String productId;
	
	public Locker() {
	}
	
	public Locker(String id , String productId) {
		this.id = id;
		this.productId = productId;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
}
