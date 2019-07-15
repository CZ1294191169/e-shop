package cn.edu.cuit.ssm.service;


import com.github.pagehelper.PageInfo;

import cn.edu.cuit.ssm.entity.Goods;
import java.util.List;



public interface GoodsService {
	PageInfo<Goods> findAll(int pageNum,int pageSize);
	
	 List<Goods> fuzzysearch(String condition);
	 
	 boolean insertGoods(Goods good);
	 
	 boolean deleteGoods(Integer id);
	 
	 Goods findBygoodId(Integer id);
	 
	 boolean modifuGoods(String name,
			 double price,
			 Integer num,
			 String img,Integer id);
}

