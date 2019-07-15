package cn.edu.cuit.ssm.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.edu.cuit.ssm.entity.User;

public interface UserMapper {
    @Select("select count(*) from users where user_name=#{name} and user_pass=#{pass}")
	int findUserByNameAndPwd(@Param("name") String name,@Param("pass") String pass);
    
    @Insert("insert into users(user_id,user_name,user_pass,user_phone,user_address) values(default,#{name},#{pass},#{phone},#{address})")
    int insertUsertoDb(User user);
    
    @Select("select *  from users where user_name = #{name}")
    int selectUser(@Param("name") String name);

}