package UserInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class UserRepository {
	ArrayList<User> listOfUsers = new ArrayList<User>(); 
	Map<String,User> users = new HashMap<>();
	public UserRepository() {
		User user1 = new User("AAAA", "1111", "김서원", "010324234");
		User user2 = new User("BBBB", "2222", "홍길동" ,"012021313");
		users.put("AAAA",user1);
		users.put("BBBB", user2);
	}

	public ArrayList<User> findAll() { //모든 회원정보 가져오기
		return new ArrayList<>(users.values());
	}
	
	public User find(String id) { //특정 user 정보 가져오기
		return users.get(id);
	}

	public boolean addUser(User user) { //user 정보 추가
		if(!users.containsKey(user.getId())) {
			users.put(user.getId(),user);
			return true;
		}
		return false;
	}

}
