package ProductInfo;

import java.util.ArrayList;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();

	public ProductRepository() {
	    Product book1 = new Product("B1111", "데이터베이스", 30000);
	    book1.setDescription("데이터베이스, OLE, SQL, 정규화, E-R 다이어그램 포함");
	    book1.setCategory("DB");
	    book1.setManufacturer("출판사A");
	    book1.setUnitsInStock(100);
	    book1.setCondition("new");

	    Product book2 = new Product("B2222", "DB강화 ISP", 25000);
	    book2.setDescription("데이터베이스, JSP, HTML, Servlet, JDBC");
	    book2.setCategory("Web");
	    book2.setManufacturer("출판사B");
	    book2.setUnitsInStock(200);
	    book2.setCondition("popular");

	    Product book3 = new Product("B3333", "Spring", 40000);
	    book3.setDescription("Spring Framwork, Spring Boot, Java Bean");
	    book3.setCategory("Web");
	    book3.setManufacturer("출판사C");
	    book3.setUnitsInStock(300);
	    book3.setCondition("general");
	    
	    Product book4 = new Product("B9999", "Summer", 55000);
	    book3.setDescription("Summer Vacation Ideas, Beach Reads, Outdoor Activities");
	    book3.setCategory("Travel");
	    book3.setManufacturer("Publisher XYZ");
	    book3.setUnitsInStock(150);
	    book3.setCondition("new");
	    
	    Product book5 = new Product("B7777", "Autumn", 48000);
	    book4.setDescription("Autumn Leaves, Cozy Reads, Pumpkin Spice Recipes");
	    book4.setCategory("Lifestyle");
	    book4.setManufacturer("Publisher ABC");
	    book4.setUnitsInStock(200);
	    book4.setCondition("new");

	    Product book6 = new Product("B5555", "Winter", 60000);
	    book5.setDescription("Winter Wonderland, Holiday Recipes, Cozy Fireside Reads");
	    book5.setCategory("Seasonal");
	    book5.setManufacturer("Publisher DEF");
	    book5.setUnitsInStock(100);
	    book5.setCondition("popular");
	    listOfProducts.add(book1);
	    listOfProducts.add(book2);
	    listOfProducts.add(book3);
	    listOfProducts.add(book4);
	    listOfProducts.add(book5);
	    listOfProducts.add(book6);
	}

	public ArrayList<Product> getAllProducts() {
	    return listOfProducts;
	}
	
	public Product getProductById(String productId) {
	    Product productById = null;
	    
	    for (int i = 0; i < listOfProducts.size(); i++) {
	        Product product = listOfProducts.get(i);
	        if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
	            productById = product;
	            break;
	        }
	    }
	    return productById;
	}
	
	public boolean productExist(String productId) {
		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				return true;
			}
		}
		return false;
	}
	
	public boolean productCondition(String condition ,int i) {
			Product product = listOfProducts.get(i);
			if (product != null && product.getCondition() != null && product.getCondition().equals(condition)) {
				return true;
			}
		return false;
	}

	public void addProduct(Product product) {
	    listOfProducts.add(product);
	}
}
