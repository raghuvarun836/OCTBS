package com.wipro.ctb.user.services;


import com.wipro.ctb.user.model.StoringUserDetails;

public interface UserService {
	
	public StoringUserDetails logUser(String email,String password);

}
