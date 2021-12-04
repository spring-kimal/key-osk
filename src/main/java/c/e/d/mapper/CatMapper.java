package c.e.d.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import c.e.d.data.Category;


@Mapper
public interface CatMapper {
	
	@Select("select * from category")
	public List<Category> findAll();
	
	@Select("select * from category where catId = #{catId}")
	public Optional<Category> findById(@Param("catId") int catId);
	
	@Insert("insert into category values(#{cat.catId}, #{cat.catName})")
	public void save(@Param("cat") Category cat);
	
}
