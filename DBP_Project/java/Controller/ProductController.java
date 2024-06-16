package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.beanutils.BeanUtils;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Order.Locker;
import Order.LockerDAO;
import Order.OrderDAO;
import Order.OrderInfo;
import Order.OrderList;
import Order.OrderListDAO;
import Order.Orders;
import UserInfo.*;
import ProductInfo.Product;
import ProductInfo.ProductDAO;
import ShoppingCart.Cart;
import ShoppingCart.CartDAO;
import ShoppingCart.CartItems;

@WebServlet("/productController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDAO productDao;
	UserDAO userDao;
	CartDAO cartDao;
	LockerDAO lockerDao;
	OrderDAO orderDao;
	DeliveryInfoDAO deliveryInfoDao;
	OrderListDAO orderListDao;
	private String path;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		productDao = new ProductDAO();
		userDao = new UserDAO();
		cartDao = new CartDAO();
		lockerDao = new LockerDAO();
		deliveryInfoDao = new DeliveryInfoDAO();
		orderDao = new OrderDAO();
		orderListDao = new OrderListDAO();
		path = getServletContext().getRealPath("/images");
		File folder = new File(path);
		if (!folder.exists()) {
			folder.mkdir();
		}
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		addCartDataToRequest(request, response);
		String action = request.getParameter("action");
		String view = "";

		if (action == null) {
			getServletContext().getRequestDispatcher("/productController?action=welcome").forward(request, response);
		} else {
			switch (action) {
			case "productInfo": //
				view = productInfo(request, response);
				break;
			case "productdetails": //
				view = productdetails(request, response);
				break;
			case "welcome":
				view = welcome(request, response);
				break;
			case "login":
				view = login(request, response);
				break;
			case "pwModify":
				view = pwModify(request, response);
				break;
			case "userPurchaseInfo":
				view = userPurchaseInfo(request, response);
				break;
			case "pwModifiyProcess":
				view = pwModifiyProcess(request, response);
				break;
			case "join":
				view = join(request, response);
				break;
			case "addProduct":
				view = addProduct(request, response);
				break;
			case "processLogin":
				view = processLogin(request, response);
				break;
			case "processLogOut":
				view = processLogOut(request, response);
				break;
			case "processAddProduct":
				view = processAddProduct(request, response);
				break;
			case "purchase":
				view = purchase(request, response);
				break;
			case "new":
				view = neW(request, response);
				break;
			case "joinProcess":
				view = joinProcess(request, response);
				break;
			case "processPurchase":
				try {
					view = processPurchase(request, response);
				} catch (UnsupportedEncodingException | IllegalAccessException | InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case "manage":
				view = manage(request, response);
			case "processDeleteProduct":
				view = processDeleteProduct(request, response);
				break;
			case "updateProduct":
				view = updateProduct(request, response);
				break;
			case "processUpdateProduct":
				view = processUpdateProduct(request, response);
				break;
			case "updateUser":
				view = updateUser(request, response);
				break;
			case "managePurchase":
				view = managePurchase(request, response);
				break;
			case "processUpdateUser":
				view = processUpdateUser(request, response);
				break;
			case "processManageUpdateUser":
				view = processManageUpdateUser(request, response);
				break;
			case "manageMember":
				view = manageMember(request, response);
				break;
			case "search":
				view = search(request, response);
				break;
			case "popular":
				view = popular(request, response);
				break;
			case "cartInsert":
				view = cartInsert(request, response);
				break;
			case "processpurchaseUserRegister":
				try {
					view = processpurchaseUserRegister(request, response);
				} catch (IllegalAccessException | InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case "purchaseUserConfirm":
				view = purchaseUserConfirm(request, response);
				break;
			case "processpurchaseUserRegister_update":
				try {
					view = processpurchaseUserRegister_update(request, response);
				} catch (IllegalAccessException | InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			// ajax 처리
			case "cartDelete":
				cartDelete(request, response);
				return;
			case "cartUpdate":
				cartUpdate(request, response);
				return;
			case "totalPurchase":
				view = totalPurchase(request, response);
				break;
			case "deliveryUpdate":
				view = deliveryUpdate(request, response);
				break;
			case "processdeliveryUpdate":
				view = processdeliveryUpdate(request, response);
				break;
			case "manageUpdateUser":
				view = manageUpdateUser(request, response);
				break;
			}
		}
		getServletContext().getRequestDispatcher("/homework/" + view).forward(request, response);
	}

	private String productdetails(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("sessionId");

		request.setAttribute("c", cartDao.findAll(userId));
		request.setAttribute("p", productDao.find(request.getParameter("productId")));

		return "productDetails.jsp";
	}

	private String updateProduct(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("p", productDao.find(request.getParameter("productId")));
		return "updateProduct.jsp";
	}

	private String productInfo(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("products", productDao.findAll());
		return "productinfo.jsp";
	}

	private String welcome(HttpServletRequest request, HttpServletResponse response) {
		return "welcome.jsp";
	}

	private String login(HttpServletRequest request, HttpServletResponse response) {
		return "login.jsp";
	}

	private String pwModify(HttpServletRequest request, HttpServletResponse response) {
		return "pwModify.jsp";
	}

	private String join(HttpServletRequest request, HttpServletResponse response) {
		return "join.jsp";
	}

	private String manage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("products", productDao.findAll());
		return "manage.jsp";
	}

	private String managePurchase(HttpServletRequest request, HttpServletResponse response) {
		List<OrderInfo> ol = new ArrayList<>();
		List<Orders> o = new ArrayList<>();
		o = orderDao.findAll();

		for (Orders i : o) {
			List<OrderList> orderDetails = orderListDao.findOrderId(i.getOrderId());
			OrderInfo orderInfo = new OrderInfo(i.getOrderDate(), i.getId(), orderDetails);
			ol.add(orderInfo);
		}

		request.setAttribute("orderlist", ol);
		return "managePurchase.jsp";
	}

	private String updateUser(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("u", userDao.find(request.getParameter("userId")));
		return "updateUser.jsp";
	}

	private String manageMember(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("users", userDao.findAll());
		return "manageMember.jsp";
	}

	private String deliveryUpdate(HttpServletRequest request, HttpServletResponse response) {
		String productId = request.getParameter("productId");
		String orderId = request.getParameter("orderId");
		request.setAttribute("productId", productId);
		request.setAttribute("orderId", orderId);

		return "deliveryUpdate.jsp";
	}

	private String search(HttpServletRequest request, HttpServletResponse response) {
		String search = request.getParameter("search");
		request.setAttribute("products", productDao.search(search));
		return "productinfo.jsp";
	}

	private String popular(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("products", productDao.findCond("popular"));
		return "productinfo.jsp";
	}

	private String neW(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("products", productDao.findCond("new"));
		return "productinfo.jsp";
	}

	private String userPurchaseInfo(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("sessionId");
		List<OrderInfo> ol = new ArrayList<>();
		List<Orders> o = new ArrayList<>();
		o = orderDao.findUser(userId);

		for (Orders i : o) {
			String date = i.getOrderDate();
			List<OrderList> orderDetails = orderListDao.findOrderId(i.getOrderId());
			OrderInfo orderInfo = new OrderInfo(date, orderDetails);
			ol.add(orderInfo);
		}

		request.setAttribute("orderlist", ol);
		return "userPurchaseInfo.jsp";
	}

	private String purchaseUserConfirm(HttpServletRequest request, HttpServletResponse response) {
		return "purchaseUserConfirm.jsp";
	}

	// 사용자 주소 등록
	private String processpurchaseUserRegister(HttpServletRequest request, HttpServletResponse response)
			throws IllegalAccessException, InvocationTargetException {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("sessionId");
		DeliveryInfo d = new DeliveryInfo();
		BeanUtils.populate(d, request.getParameterMap());
		d.setId(userId);
		deliveryInfoDao.insert(d);
		return totalPurchase(request, response);
	}

	// 사용자 기존 주소 존재시 주소 업데이트
	private String processpurchaseUserRegister_update(HttpServletRequest request, HttpServletResponse response)
			throws IllegalAccessException, InvocationTargetException {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("sessionId");
		DeliveryInfo d = new DeliveryInfo();
		BeanUtils.populate(d, request.getParameterMap());
		d.setId(userId);
		deliveryInfoDao.update(d);
		return totalPurchase(request, response);
	}

	private String joinProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		if (user.getId() != null && userDao.find(user.getId()) == null) {
			userDao.insert(user);
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('아이디가 동일합니다\\n다른 아이디로 입력해주세요');");
			out.println("window.location.href = '/DBP_Project/productController?action=login';");
			out.println("</script>");
			out.close();
			return "";
		}
		return welcome(request, response);
	}

	private String addProduct(HttpServletRequest request, HttpServletResponse response) {
		return "addProduct.jsp";
	}

	private String processLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		User user = userDao.find(id);

		if (id != null && password != null && user != null && user.getId().equals(id)
				&& user.getPw().equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("sessionName", user.getName());
			session.setAttribute("sessionId", id);
			return welcome(request, response);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다');");
			out.println("window.location.href ='/DBP_Project/productController?action=login';");
			out.println("</script>");
			out.flush();
			out.close();
			return login(request, response);
		}

	}

	private String processLogOut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		session.invalidate();

		return "welcome.jsp";
	}

	private String pwModifiyProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HashMap<String, String> map = new HashMap<>();
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("sessionId");
		String pw_present = request.getParameter("pw_present");
		String pw_moidfy = request.getParameter("pw_modify");
		User user = userDao.find(sessionId);

		if (user.getPw() != null && user.getPw().equals(pw_present)) {
			user.setPw(pw_moidfy);
			map.put("pw", pw_moidfy);
			userDao.update(user, map);
			return "welcome.jsp";
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('현재 비밀번호가 틀렸습니다');");
			out.println("window.location.href='homework/pwModify.jsp';");
			out.println("</script>");
			out.flush();
			out.close();
			return "pwModify.jsp";
		}
	}

	private String processAddProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Product b = new Product();

		try {
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8",
					new DefaultFileRenamePolicy());
			// 업로드된 파일의 이름을 가져옴
			String uploadedFileName = multi.getFilesystemName("file");
//			BeanUtils.populate(b, request.getParameterMap());
			b.setProductId(multi.getParameter("productId"));
			b.setPname(multi.getParameter("pname"));
			String unitPriceStr = multi.getParameter("unitPrice");
			if (unitPriceStr != null && !unitPriceStr.isEmpty()) {
				b.setUnitPrice(Integer.parseInt(unitPriceStr));
			}
			b.setDescription(multi.getParameter("description"));
			b.setManufacturer(multi.getParameter("manufacturer"));
			b.setCategory(multi.getParameter("category"));
			String unitsInStockStr = multi.getParameter("unitsInStock");
			if (unitsInStockStr != null && !unitsInStockStr.isEmpty()) {
				b.setUnitsInStock(Integer.parseInt(unitsInStockStr));
			}
			b.setCond(multi.getParameter("cond"));
			b.setProductImg(uploadedFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		productDao.insert(b);
		return manage(request, response);
	}

	private String processUpdateProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Product b = new Product();
		HashMap<String, Object> map = new HashMap<>();
		MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8",
				new DefaultFileRenamePolicy());

		try {
			// MultipartRequest에서 파라미터를 가져와 Product 객체에 매핑
//	        BeanUtils.populate(b, multi.getParameterMap());
			b.setProductId(multi.getParameter("productId"));
			b.setCategory(multi.getParameter("category"));
			b.setCond(multi.getParameter("cond"));
			b.setDescription(multi.getParameter("description"));
			b.setManufacturer(multi.getParameter("manufacturer"));
			b.setPname(multi.getParameter("pname"));
			if (multi.getParameter("unitPrice") != null && !multi.getParameter("unitPrice").isEmpty()) {
				b.setUnitPrice(Integer.parseInt(multi.getParameter("unitPrice")));
				map.put("unitprice", b.getUnitPrice());
			}
			;
			if (multi.getParameter("unitsInStock") != null && !multi.getParameter("unitsInStock").isEmpty()) {
				b.setUnitsInStock(Integer.parseInt(multi.getParameter("unitsInStock")));
				map.put("unitsinstock", b.getUnitsInStock());
			}

			if (b.getCategory() != null && !b.getCategory().isEmpty()) {
				map.put("category", b.getCategory());
			}
			if (b.getCond() != null && !b.getCond().isEmpty()) {
				map.put("cond", b.getCond());
			}
			if (b.getDescription() != null && !b.getDescription().isEmpty()) {
				map.put("description", b.getDescription());
			}
			if (b.getManufacturer() != null && !b.getManufacturer().isEmpty()) {
				map.put("manufacturer", b.getManufacturer());
			}
			if (b.getPname() != null && !b.getPname().isEmpty()) {
				map.put("pname", b.getPname());
			}
			// 이미지 파일 처리
			String uploadedFileName = multi.getFilesystemName("file");
			if (uploadedFileName != null && !uploadedFileName.isEmpty()) {
				b.setProductImg(uploadedFileName);
				map.put("productimg", b.getProductImg());
			}

			if (map.isEmpty()) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('입력을 해주세요');");
				out.print("window.location.href='/DBP_Project/productController?action=updateProduct';");
				out.print("</script>");
				out.close();
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		productDao.update(b, map);
		return manage(request, response);
	}

	// 회원정보 수정 일부만 변경도 가능
	private String processUpdateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		User u = new User();
		HashMap<String, String> map = new HashMap<>();
		HttpSession session = request.getSession();
		try {
			BeanUtils.populate(u, request.getParameterMap());
			u.setId(String.valueOf(session.getAttribute("sessionId")));
			if (u.getName() != null && !u.getName().isEmpty()) {
				map.put("name", u.getName());
				session.setAttribute("sessionName", u.getName());
			}
			if (u.getNumber() != null && !u.getNumber().isEmpty()) {
				map.put("number", u.getNumber());
			}
			if (map.isEmpty()) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('입력을 해주세요');");
				out.print("window.location.href='/DBP_Project/productController?action=updateUser';");
				out.print("</script>");
				out.close();
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		userDao.update(u, map);
		return welcome(request, response);
	}

	// 상품 정보 삭제
	private String processDeleteProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			String[] productIds = request.getParameterValues("productIds");
			if (productIds != null) {
				for (String productId : productIds) {
					productDao.delete(productId);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return manage(request, response);
	}

	private String manageUpdateUser(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		request.setAttribute("userId", userId);
		return "manageUpdateUser.jsp";
	}

	private String processManageUpdateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		User u = new User();
		HashMap<String, String> map = new HashMap<>();

		try {
			BeanUtils.populate(u, request.getParameterMap());
			if (u.getName() != null && !u.getName().isEmpty()) {
				map.put("name", u.getName());
			}
			if (u.getNumber() != null && !u.getNumber().isEmpty()) {
				map.put("number", u.getNumber());
			}
			if (map.isEmpty()) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('입력을 해주세요');");
				out.print("window.location.href='/DBP_Project/productController?action=manageMember';");
				out.print("</script>");
				out.close();
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		userDao.update(u, map);
		return manageMember(request, response);
	}

	private String cartInsert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession s = request.getSession();
		String productId = request.getParameter("productId");
		String userId = (String) s.getAttribute("sessionId");
		Cart cart = new Cart();

		cart = cartDao.find(userId, productId);
		if (cart.getCartInCount() != null) {
			cart.setCartInCount(cart.getCartInCount() + 1); // 기존수량에서 수량증가
			cartDao.update(cart);
		} else {
			cart.setCartInCount(1);
			cart.setProductId(productId);
			cart.setuserId(userId);
			cartDao.insert(cart);
		}
		return productInfo(request, response);
	}

	// 장바구니 삭제
	private void cartDelete(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String productId = request.getParameter("productId");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("sessionId");
		if (userId != null && !userId.isEmpty()) {
			cartDao.delete(userId, productId);
		}
	}

	// 사용자 바구니목록 저장
	private void addCartDataToRequest(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("sessionId");
		if (userId != null && !userId.isEmpty()) {
			request.setAttribute("carts", cartDao.findAll(userId));
		}
	}

	private void cartUpdate(HttpServletRequest request, HttpServletResponse response) {
		String productId = request.getParameter("productId");
		Integer cartInCount = Integer.parseInt(request.getParameter("cartInCount"));
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("sessionId");
		Cart cart = new Cart();
		cart.setCartInCount(cartInCount);
		cart.setuserId(userId);
		cart.setProductId(productId);
		if (userId != null && !userId.isEmpty()) {
			cartDao.update(cart);
		}
	}

	private String processPurchase(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, IllegalAccessException, InvocationTargetException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("sessionId");
		int count = Integer.parseInt(request.getParameter("count"));
		try {
			String[] productIds = request.getParameterValues("productIds");
			Cart c = new Cart();
			c.setCartInCount(count);
			c.setProductId(productIds[0]);
			c.setuserId(userId);
			cartDao.insert(c);
			if (productIds != null) {
				for (String productId : productIds) {
					Locker locker = new Locker();
					locker.setId(userId);
					locker.setProductId(productId);
					lockerDao.delete(locker);
					lockerDao.insert(locker);
				}
			}
			// 사용자 기존 배달정보 확인
			DeliveryInfo d = deliveryInfoDao.select(userId);
			if (d != null) {
				request.setAttribute("d", d);
			} else {
				request.setAttribute("d", null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "purchaseUserRegister.jsp";
	}

	private String purchase(HttpServletRequest request, HttpServletResponse response) {
		String productId = request.getParameter("productId");
		String count = request.getParameter("count");
		request.setAttribute("count", count);
		request.setAttribute("p", productDao.find(productId));
		return "purchase.jsp";
	}

	private String processdeliveryUpdate(HttpServletRequest request, HttpServletResponse response) {
		String orderstatus = request.getParameter("orderstatus");
		String productId = request.getParameter("productId");
		Integer orderId = Integer.parseInt(request.getParameter("orderId"));
		System.out.println(orderstatus + " " + productId + " " + orderId);
		orderListDao.updateDelivery(productId, orderId, orderstatus);
		return managePurchase(request, response);
	}

	private String totalPurchase(HttpServletRequest request, HttpServletResponse response) {
		List<CartItems> c = new ArrayList<>();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("sessionId");

		// 총 구매 합계
		c = cartDao.findAll(userId);
		int totalPrice = 0;
		for (var total : c) {
			totalPrice = total.getProduct().getUnitPrice() * total.getCartInCount();
		}
		// 최종 주문(사용자, 최종가격) db에 저장
		orderDao.insert(userId, totalPrice);
		// 주문 목록 db에 저장만 하면 끝
		Orders order = orderDao.find(userId);
		for (var total : c) {
			orderListDao.insert(total, order.getOrderId());
			// 가져온 주문정보 수량 업데이트하기
			Product p = new Product();
			p = productDao.find(total.getProduct().getProductId());
			int updatestock = p.getUnitsInStock() - total.getCartInCount();
			p.setUnitsInStock(updatestock);
			productDao.updateProductCount(p);
			cartDao.delete(userId);
			productDao.updateProductCount(p);
		}
		return purchaseUserConfirm(request, response);
	}

}
