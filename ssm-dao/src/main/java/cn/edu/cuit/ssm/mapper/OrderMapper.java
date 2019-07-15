package cn.edu.cuit.ssm.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.edu.cuit.ssm.entity.Order;

public interface OrderMapper {
	
	@Insert("insert into eshop.order(id,name,gid,num) values(default,#{name},#{gid},#{num})")
	int insertIntoorder(@Param("name") String name,
						@Param("gid") Integer gid,
						@Param("num") Integer num
						);
	
	@Select("select name,gid,num from eshop.order where eshop.order.name = #{name}")
	 List<Order> selectOrder(@Param("name") String name);

}