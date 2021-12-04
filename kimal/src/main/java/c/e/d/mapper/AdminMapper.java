package c.e.d.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import c.e.d.data.Admin;

@Mapper
public interface AdminMapper {
	@Select("select * from admin")
	public List<Admin> findAll();
	
	@Select("select * from admin where adminId = #{id}")
	public Optional<Admin> findById(@Param("id")String id);
	
	@Insert("insert into admin values(#{id},#{pw})")
	public void save(@Param("id") String id, @Param("pw") String pw);
}
