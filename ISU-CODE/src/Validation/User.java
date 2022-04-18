package Validation;

public class User {

	private String name;
	private String password;
	private String email;
	private int role;
	
	public User (String n, String p, String e, int r) {
		name = n;
		password = p;
		email = e;
		role = r;
	
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
	
	
	
}
