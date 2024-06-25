package com.DAO;

import com.entity.Users;

public interface UserDAO {
	public boolean userRegister(Users us);
	
	public Users login(String email, String password);
	
	public String UserNameById(int UserID);
}
