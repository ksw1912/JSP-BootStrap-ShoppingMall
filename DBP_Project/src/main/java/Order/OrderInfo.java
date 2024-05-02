package Order;
import ProductInfo.Product;

public class OrderInfo {
	private String name;
	private String address;
	private String zipCode;
	private Product product;
	private int count;
	
	OrderInfo(Product product,String name, String zipCode, String address,int count){
		this.product = product;
		this.name = name;
		this.address = address;
		this.zipCode = zipCode;
		this.count = count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
