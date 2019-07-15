package cn.edu.cuit.ssm.service;

import cn.edu.cuit.ssm.entity.User;

public interface UserService {
	boolean login(String name, String pass);
	
	
	boolean insertUserintoDb(User user);
	
	boolean ck(String name);

}

