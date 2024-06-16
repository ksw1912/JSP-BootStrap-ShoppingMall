package ShoppingCart;

public class Cart {
	private String userId;
	private String productId;
	private Integer cartInCount;
	private String create;
	private String update;

	public Cart() {
	}

	public Cart(String userId, String productId, Integer cartInCount) {
		this.userId = userId;
		this.productId = productId;
		this.cartInCount = cartInCount;
	}

	public String getuserId() {
		return userId;
	}

	public void setuserId(String userId) {
		this.userId = userId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public Integer getCartInCount() {
		return cartInCount;
	}

	public void setCartInCount(Integer cartInCount) {
		this.cartInCount = cartInCount;
	}

	public String getCreate() {
		return create;
	}

	public void setCreate(String create) {
		this.create = create;
	}

	public String getUpdate() {
		return update;
	}

	public void setUpdate(String update) {
		this.update = update;
	}
}