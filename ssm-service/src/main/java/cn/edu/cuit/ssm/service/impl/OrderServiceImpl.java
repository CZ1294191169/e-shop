package cn.edu.cuit.ssm.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cuit.ssm.entity.Order;
import cn.edu.cuit.ssm.mapper.OrderMapper;
import cn.edu.cuit.ssm.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderMapper orderMapper;

	

	@Override
	public boolean insertCart(String name, Integer gid, Integer num) {
		// TODO Auto-generated method stub
		int ret  = orderMapper.insertIntoorder(name,gid,num);
		if(ret>0) {
			return true;
		}
		return false;
	}



	@Override
	public List<Order> findOrder(String name) {
		// TODO Auto-generated method stub
		return orderMapper.selectOrder(name);
	}

}