package c.e.d.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import c.e.d.data.Users;

@Mapper
public interface UserMapper {
	@Select("select * from user")
	public List<Users> findAll();
	
	@Select("select * from user where id = #{id}")
	public Optional<Users> findById(@Param("id")String id);
	
	@Insert("insert into admin values (adminId=#{user.id}, adminPw=#{user.password})")
	public void save(@Param("user") Users user);
}
