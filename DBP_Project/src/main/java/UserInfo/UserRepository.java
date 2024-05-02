package UserInfo;

import java.util.ArrayList;

public class UserRepository {
	ArrayList<User> listOfUsers = new ArrayList<User>();

	public UserRepository() {
		User user1 = new User("AAAA", "1111", "김서원", "010324234");
		User user2 = new User("BBBB", "2222", "홍길동" ,"012021313");

		listOfUsers.add(user1);
		listOfUsers.add(user2);
	}

	public User getUserById(String userId, String pw) {
		User userById = null;

		for (int i = 0; i < listOfUsers.size(); i++) {
			User user = listOfUsers.get(i);
			if (user != null && user.getId() != null && user.getId().equals(userId) && user.getPw() != null
					&& user.getPw().equals(pw)) {
				userById = user;
				break;
			}
		}
		return userById;
	}

	public User getUserinfo(String name) {
		User userinfo = null;
		for (int i = 0; i < listOfUsers.size(); i++) {
			User user = listOfUsers.get(i);
			if (user != null && user.getName() != null && user.getName().equals(name)) {
				userinfo = user;
				break;
			}
		}
		return userinfo;
	}

	public ArrayList<User> getAllUser() {
		return listOfUsers;
	}

	public void addUser(User user) {
		listOfUsers.add(user);
	}

}
