package cn.edu.cuit.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.edu.cuit.ssm.entity.Goods;

public interface GoodsMapper {
    @Select("select goods_id as id,goods_name as name,goods_price as price,goods_num as num,goods_img as img ,goods_type as type from goods")
	List<Goods> findAll();
    
    @Select("select goods_id as id,goods_name as name,goods_price as price,goods_num as num,goods_img as img ,goods_type as type from goods where concat(goods_name,goods_price,goods_num)like concat('%',concat(#{condition},'%'))")
    List<Goods> fuzzysearch(@Param("condition") String condition);
    
    @Insert("insert into goods(goods_id,goods_name,goods_price,goods_num,goods_img,goods_type) values(default,#{name},#{price},#{num},#{img},#{type})")
    int insertGoods(Goods good);
    
    @Delete("delete from goods where goods_id=#{id}")
    int deleteGoods(@Param("id")Integer id);
    
    @Select("select goods_id as id,goods_name as name,goods_price as price,goods_num as num,goods_img as img ,goods_type as type from goods where goods_id = #{id}")
    Goods findGoodsbyId(@Param("id")Integer id);
    
    @Update("update goods set goods_name = #{name},goods_price =#{price},goods_num=#{num},goods_img = #{img} where goods_id=#{id}")
    int modify(@Param("name") String name,
    		@Param("price") double price,
    		@Param("num") Integer num,
    		@Param("img") String img,
    		@Param("id")Integer id);

}

