package UserInfo;

public class User {
	private String id;
	private String pw;
	private String name;
	private String number;
	public User() {
		
	}
	public User(String id, String pw, String name) {
		this.id = id;
		this.pw = pw;
		this.name = name;
	}
	public User(String id, String pw, String name, String number) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.number = number;
	}

	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}