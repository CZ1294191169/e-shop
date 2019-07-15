package cn.edu.cuit.ssm.service;

import java.util.List;

import cn.edu.cuit.ssm.entity.Order;

public interface OrderService {
	
	boolean insertCart(String name,Integer gid,Integer num);
	
	List<Order> findOrder(String name);

}
