package cn.edu.cuit.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cuit.ssm.mapper.UserMapper;
import cn.edu.cuit.ssm.service.UserService;



import cn.edu.cuit.ssm.entity.User;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public boolean login(String name, String pass) {
		int ret=userMapper.findUserByNameAndPwd(name, pass);
		if (ret>0) {
			return true;
		}
		return false ;
	}

	@Override
	public boolean insertUserintoDb(User user) {
		// TODO Auto-generated method stub
		int ret = userMapper.insertUsertoDb(user);
		if(ret>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean ck(String name) {
		// TODO Auto-generated method stub
		int ret = userMapper.selectUser(name);
		if(ret>0) {
			return true;
		}
		return false;
	}

}
