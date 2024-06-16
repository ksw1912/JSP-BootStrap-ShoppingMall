package ShoppingCart;

import ProductInfo.Product;

public class CartItems {
	private Product product;
	private int cartInCount;
	
	public CartItems() {
		
	}
	public CartItems(Product product, int cartInCount) {
		this.product = product;
		this.cartInCount = cartInCount;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getCartInCount() {
		return cartInCount;
	}
	public void setCartInCount(int cartInCount) {
		this.cartInCount = cartInCount;
	}
}
