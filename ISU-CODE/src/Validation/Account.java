package Validation;

public class Account {

	private User user_acc;
	
	public Account(User user_acc)
	{
		this.user_acc= new User (user_acc.getName(), user_acc.getEmail(),user_acc.getPassword(),user_acc.getRole());
	}
	
	
	
	public User getUser() {
		
		return user_acc;
	}
	
	
	
}
