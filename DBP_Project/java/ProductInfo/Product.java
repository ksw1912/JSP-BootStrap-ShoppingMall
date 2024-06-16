package ProductInfo;

import java.io.Serializable;

public class Product {
	
	private String productId;		//상품ID
	private String pname;			//상품명
	private Integer unitPrice;	 	//가격 가격
	private String description; 	//상품 설명
	private String manufacturer;	//제조사
	private String category; 		//분류 ex: 상의,하의
	private Integer unitsInStock ; 		//재고수 
	private String cond; 		//인기,일반,신규
	private String productImg;
	
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public Product() {
		
	}
	public Product(String productId, String pname, Integer unitPrice, String description, String manufacturer, String category, Integer unitsInStock, String cond) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
		this.description = description;
		this.manufacturer = manufacturer;
		this.category = category;
		this.unitsInStock = unitsInStock;
		this.cond = cond;
	}
	public String getProductId() {
		return productId;
	}
	
	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(Integer unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCond() {
		return cond;
	}

	public void setCond(String cond) {
		this.cond = cond;
	}
}
