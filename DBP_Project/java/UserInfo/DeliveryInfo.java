package UserInfo;

public class DeliveryInfo {
	String id;
	Integer deliveryNum;
	String recipient;
	String address;
	String recipient_number;

	public DeliveryInfo() {

	}

	DeliveryInfo(String id, String recipient, String address, String recipient_number) {
		this.id = id;
		this.recipient = recipient;
		this.address = address;
		this.recipient_number = recipient_number;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getDeliveryNum() {
		return deliveryNum;
	}

	public void setDeliveryNum(Integer deliveryNum) {
		this.deliveryNum = deliveryNum;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRecipient_number() {
		return recipient_number;
	}

	public void setRecipient_number(String recipient_number) {
		this.recipient_number = recipient_number;
	}
}
